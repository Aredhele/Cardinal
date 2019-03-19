# ![Cardinal](https://raw.githubusercontent.com/Aredhele/Cardinal/master/Docs/Visual/Banner.png)

# Cardinal coding standard

<p align="justify">
The following coding standard has been created for the specific needs of this project. Most of these
rules exist to allow efficient reading and fast refactoring. This document, not definitive, will be updated and is open for discussion. If you want to contribute by sending pull request, we'll make sure that your code conforms to our standard.
</p>

### On this page : 
   - <a href="#Introduction">Introduction</a>
   - <a href="#Copyright">Copyright</a> 
   - <a href="#Naming">Naming convention</a>
        - <a href="#FileExt">File extension</a>
        - <a href="#FileNaming">File name</a>
        - <a href="#TypeNaming">Type naming</a>
        - <a href="#NamingExamples">Examples</a>
   - <a href="#Comments">Documentation and comments</a>
       - <a href="#CommentsExamples">Examples</a>
   - <a href="#ConstCorrectness">Const correctness</a> 
   - <a href="#cpp11cpp14">C++11 and C++14</a> 
   - <a href="#CodeFormatting">Code formatting</a> 
   - <a href="#Namespaces">Namespaces</a>
   - <a href="#Containers">Containers</a>
   - <a href="#Memory">Memory</a> 
   - <a href="#Optimization">Optimization</a>
  
#### Introduction <div id="Introduction"></div>

<p align="justify">
For maintainability purposes, the focus should be <b>readability and comprehension</b>. It implies that an internal 
documentation will be maintained and <b>each non-trivial</b> code should be at least shortly described. If code
is taken from the internet, it could be interesting to mention the source in the documentation block. 
</p>

#### Copyright Notice <div id="Copyright"></div>
Each file must include the following copyright notice :

```
   Coming soon.
```

#### Naming conventions <div id="Naming"></div>

<p align="justify">
Why naming conventions ? Having such conventions or standards help developers to stay coherent from one source file to another. We all have different personal conventions which in addition evolves over time. Without any standard, it leads to a messy result. Moreover this helps all non-contributor developers to quickly read and understand the code.
</p>

#### File extension <div id="FileExt"></div>

* C code file extensions are **.h, .c**
* C++ code file extensions are **.hpp, .cpp**

#### File name <div id="FileNaming"></div>

In order to be able to locate and identify specific files, there are some rules about the file naming :  

* Structures are prefixed by **S**
* Classes are prefixed by **C**
* Templates are prefixed by **T**
* Abstract interfaces are prefixed by **I**

Examples :

* **SData.c** is a c file containing code about the data structure
* **CPlayer.cpp** is a file containing code relative to the player class
* **TArray.hpp** is a file implementing an array using C++ templates
* **IComponent.hpp** is a file defining an interface for components

#### Type naming <div id="TypeNaming"></div>

Following file naming rules, types have similar conventions.

* Classes are prefixed by **C**, Interfaces by **I**, Template by **T**, Structure by **S** and enums by **E** :
    * class CEntityManager
    * class IComponent
    * template\<typename T> TContainer
    * struct SCreateInfo
    * enum EPlayerState
   
* The pascal case is used for classes, structures, templates, functions and methods : 
   * CEntityManager, SEntityCreateInfo, TContainer, GetData() etc.
* The snake case is used for all variables and members
   * unsigned int hit_points, field_of_view
 * Static class members are prefixed by **s_**  : s_object_counter
 * Private class members are prefixed by **m_** : m_member
 * Pointers are always prefixed by **p** : p_player
    * If the pointer is a private class member, it's possible to mix both : mp_member
    * About pointer types :
```cpp
      // Use this : 
      Data* p_data = nullptr;

      // Not these :
      Data * p_data = nullptr;
      Data *p_data  = nullptr;
```    
 * Mutator methods are prefixed by **Set**
 * Accessor method are prefixed by **Get**
 * Functions or method returning boolean should ask a question : IsInvincible(), IsEnabled() etc.
 * Explicit names are better than cryptic names except if it's really obvious

#### Examples <div id="NamingExamples"></div>

```cpp
// Class prefixed by C
class CPlayer
{
public:

   // Pointer prefixed by p
   explicit CPlayer(int hit_points);

   // Mutators are prefixed by "Set"
   void SetHitPoints(int hit_points) noexcept;

   // Accessors are prefixed by "Get"
   int GetHitPoints() const noexcept;

   // Is the player dead ?
   bool IsDead() const noexcept;

private:

   // Member variable prefixed by m
   // Member variable in snake case
   int m_hit_points;
};
```
    
#### Documentation and comments <div id="Comments"></div>

* Comments must be clear and useful
* A code comment use //
* The documentation use ///
* The documentation generator is Doxygen

#### Examples <div id="CommentsExamples"></div>

```cpp
/// \class CEntityManager
/// \brief Stores and manages all entities
class CEntityManager
{
public:

   /// \brief  Returns the current amount of entities
   /// \return The current amount of entities
   unsigned GetEntityCount() const noexcept;

private:
   unsigned m_entity_count; ///< The amount of entities
};
```

* If a keyword like *static, virtual or explicit* is used, a comment should be add before the
implementation :   

```cpp
// Declaration .hpp
virtual void Foo(void);

// Implementation .cpp
/* virtual */ void Bar::Foo(void) {}
```
    
#### Const correctness <div id="ConstCorrectness"></div>

<p align="justify">
The <b>const-correctness</b> is necessary and strongly recommended because it makes the code more robust, clearer
and even more optimized without any drawback.
</p>   
   
* Methods that doesn't modify the object state should be mark as const : int Foo() const;
* Methods that returns a read only reference should mark their return value as const : const Bar& Foo() const;
* Parameters can be passed in many possible way, don't pick the constant reference by default but pay attention
to the one you choose :
    * copy      : Foo(Bar bar)
    * reference : Foo(Bar& bar)
    * constant reference : Foo(const Bar& bar)
    * **move** : Foo(Bar&& bar) 
    
 ```cpp
 // Returns a reference on a const object
 // It take a const reference on a SFooID
 // The method is also marked as const 
 // since it doesn't modify the object
 const Foo& Foo::GetFooFromID(const SFooID& id) const;
 ``` 
 
 * About the placement of the const keyword, there's no real standard about it and it's a bit confusing.
 We suggest to always place the const on the right except for the most left, it's more intuitive : 
    * const char* p_name = "foo"; // Pointer to a constant string
    * const char* const p_name = "foo"; // Constant pointer to a constant string
    
#### C++11 and C++14 <div id="cpp11cpp14"></div>

* Use c++ cast style instead of C cast
* const_cast is not recommended
* **nullptr** : Must be used instead of C macro NULL to avoid ambiguity with the number 0 
* **auto** : Should be used in foearch loops, c++ cast expressions, lambda, iterators
    * **OK** for(const auto& entity : entities)
    * **OK** auto* pointer = static_cast<char *>(data);
    * **OK** auto lambda = \[](){ /* code */ };
    * **OK** auto const_iterator = map.cbegin();
    * **Not OK** auto foo = 5;
* And all other keywords : override, final, explicit, constexpr etc. 

**Note about override and final :** 
When marking a method as *override or final*, it suggests that it is a virtual method defined somewhere in a base class. So it becomes useless to specify *virtual* in the declaration. It is redundant.

**The forbidden one :** 
The use of *const_cast* is prohibited.

#### Code formatting <div id="CodeFormatting"></div>

```cpp 
// Bad
if(x) Do(); 

// Good
if(x)
    Do();

//  Bad
if(x) {
    Do();
} 

// Good 
if(x)
{
    Do();
}

// Bad
int player_hp;
unsigned player_ammo;
const char* p_player_name;

// Good (way better to read and a lot easier to refactor with multi-line cursor)
int         player_hp;
unsigned    player_ammo;
const char* p_player_name;

// Bad
Foo::Foo(int bar, int foo)
{
   m_bar = bar;
   m_foo = foo;
}

// Good
Foo::Foo(int bar, int foo)
: m_bar(bar)
, m_foo(foo)
{
    // None
}
```

#### Namespaces <div id="Namespaces"></div>
Namespaces are useful to avoid name clashes with other source codes and libraries or even your own code.
In Cardinal, the main namespace is **Cardinal** :
```cpp
/// \namespace Cardinal
namespace Cardinal
{

// Code

} // !namespace
```

**Note :**
Never use *using namespace* in a header, it's impossible to undo.


#### Containers <div id="Containers"></div>

```
   Coming soon.
```

#### Memory <div id="Memory"></div>
The memory is one of the main resources of the engine. And it's also easy to make a bad use of it.
Here're some advices :

* Any codes that allocates memory is in charge of its deallocation.
* Don't make useless copies, use references, constant references and the move semantic. 
* If you are handling pointers, don't hesitate to check if they're equal to nullptr (you can use assertions)
* Never break the memory alignment 
* Use engine allocators

#### Optimization <div id="Optimization"></div>

```
   Coming soon.
```
