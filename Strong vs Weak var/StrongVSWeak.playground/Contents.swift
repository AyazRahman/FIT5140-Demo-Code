// Strong VS Weak

/**
 Relevant Terms:
 
 Automatic Reference Counting(ARC): Used to track and manage your app’s memory usage
 
 Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. When an instance is no longer needed, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead.
 However, if ARC were to deallocate an instance that was still in use, it would no longer be possible to access that instance’s properties, or call that instance’s methods. To make sure that instances don’t disappear while they are still needed, ARC tracks how many properties, constants, and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.
 
*/

/*
 
 Let imagine a situation, a kid holding a balloon. The expectation is if the kid disappears the balloon would also disappear or float away from the scene, which is the expected behavior. But in a weird situation if the kid disappears, the balloon still exists in his place just floating there. So let's create some classes so that we can see this in action
 
 */

// Imagine this is the Balloon
class Balloon {
    
    var id: String
    var owner: Person?
    
    init(id: String, owner: Person?) {
        self.id = id
        self.owner = owner
    }
    
    deinit {
        print("Balloon with id: \(self.id) has been removed from memory")
    }
    
}

// This is a Person class that just holds the name of a person
class Person {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
}

// This is the normal kid who has a weak reference to his balloon
class NormalKid: Person{
    weak var balloon: Balloon?
    
    init(name: String, balloon: Balloon?) {
        super.init(name)
        self.balloon = balloon
    }
    
    deinit {
        print("Normal kid named: \(self.name) has been removed from memory")
    }
}


// This is the weird kid who has a strong reference to his balloon
class WeirdKid: Person{
    var balloon: Balloon?
    
    init(name: String, balloon: Balloon?) {
        super.init(name)
        self.balloon = balloon
    }
    
    deinit {
        print("Normal kid named: \(self.name) has been removed from memory")
    }
}

/*
 At this point all the classes are set up. Init is called when an object is being initialized and deinit is called when the object is about to be removed from the memory.
 
 Let's look at the obejcts when there is no coupling between them and how they are deleted
 */

var balloon: Balloon? = Balloon(id: "Helium Balloon1", owner: nil) // We set up a balloon with no reference to a person object
var normalKid: Person? = NormalKid(name: "Normal Kid", balloon: nil) // We set up a normal kid with no reference to a balloon object
var weirdKid: Person? = WeirdKid(name: "Weird Kid", balloon: nil) // We set up a weird kid with no reference to a balloon object

/*
 Now the expected behavior is, whenever the object has no use, the ARC would remove those object from the memory and the respective deinit functions would be called. So let's remove the references to the objects and see if the deinit functions are getting called. You will see the print statements in your console if the objects are deleted
 */

balloon = nil
normalKid = nil
weirdKid = nil
print("") // Used to print empty line

/*
 As expected whenever we lost reference to the objects, the ARC removed those object and the deinit functions are called before removing them
 */

/*
 Now lets create a balloon and initialize it to a weird kid and see if it gets deleted
 Uncomment lines 104 to 106
 */
/*
balloon = Balloon(id: "Balloon1", owner: nil) // Create a balloon with no owner initially
weirdKid = WeirdKid(name: "Weird Kid", balloon: balloon) // Weird kid created with a reference to a balloon
balloon?.owner = weirdKid // Balloon's owner initialised.
 */

/*
 Now the expectation is if we dereference both the balloon and weird kid, they should be removed from and we will see the deinit functions do the print statements again
 Uncomment lines 114 to 116
 */
/*
weirdKid = nil
balloon = nil
print("") // Used to print extra line
*/
/*
 That's strange, even when there is no reference to either the balloon or the weird kid, the objects are not getting removed from memory. We just created our first memory leak. This is because ARC maintains a counter to make sure the object is not used in the program. This counter is incremented once when the object is initialised and every time any other object it has a strong reference to. In this case of balloon, the counter is increased when the object is initalised and when the weird kid had a strong reference to it, making it a total of 2 referneces. And same for the weird kid as well. But when we are setting the variable references to nil, this decrements the counter by one and since the reference count is not 0 (2-1 = 1), ARC cannot remove either the balloon or weird kid object and they would continue to hold on to that memory.
 */

/*
 Let's use the normal kid this time and see if having a weak reference has any affect on the memory deallocation
 Uncomment lines 127 to 129
 */
/*
balloon = Balloon(id: "Balloon2", owner: nil) // Create a balloon with no owner initially
normalKid = NormalKid(name: "Normal Kid", balloon: balloon) // Normal kid created with a reference to a balloon
balloon?.owner = weirdKid // Balloon's owner initialised.
*/
/*
 Now let's see if deinitializing them removes them from memory
 Uncomment lines 136 to 138
 */
/*
balloon = nil
normalKid = nil
print("") // Used to print extra line
*/
/*
 Seems like when we dereferenced the variables, ARC was able to remove them from memory. But the print statements looks a bit out of order. Although balloon was set to nil first, normal kid was first removed from memory and then the balloon. This is because balloon had 2 references one when we initalised it and second through the strong reference it made to the normal person / owner. So when the balloon variable was set to nil, it's reference value was reduced to 1 from 2. And when the normal kid was set to nil, the reference value for balloon was reduced again from 1 to 0. After the reference count finally reached 0, ARC was able to remove the balloon from memory. In other words since balloon had a strong reference to normal kid, as long as normal kid is in memory it will have access to the balloon variable. So ARC should not remove it until all the refernece count is 0.
 
 And that's it, you just solved your first memory leak problem.
 */
