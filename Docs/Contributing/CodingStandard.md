# Ordinal Engine coding standard

The following coding standard has been created for the specific needs of the engine code. Most of these
rules exist to allow an efficient reading of the code and allow fast refactorings. This document is
not definitive and will be updated.

### On this page : 
   - <a href="#Introduction">Introduction</a>
   - <a href="#Copyright">Copyright</a> 
   - <a href="#Naming">Naming convention</a>
        - <a href="#NamingExamples">Examples</a>
   - <a href="#Comments">Documentation and comments</a>
       - <a href="#CommentsExamples">Examples</a>
   - <a href="#ConstCorrectness">Const correctness</a> 
   - <a href="#cpp11cpp14">C++11 and C++14</a> 
   - <a href="#CodeFormatting">Code formatting</a> 
   - <a href="#Namespaces">Namespaces</a> 
   - <a href="#Memory">Memory</a> 
  
#### Introduction <div id="Introduction"></div>
For maintainability purposes, the focus should be **readability and comprehension**. It implies that an internal 
documentation will be maintained and **each non-trivial** code should be at least shortly described. If code
is taken from the internet, it could be interesting to mention the source in the documentation block. 
    
#### Copyright Notice <div id="Copyright"></div>
Each file must include the following copyright notice :

    Copyright (C) 2018-2019 Ordinal Engine
    Vincent STEHLY--CALISTO, vincentstehly@hotmail.fr
    See https://vincentcalisto.com/ordinal-engine/

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    he Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
        
#### Naming conventions <div id="Naming"></div>
 * Classes are prefixed by **C**, Interfaces by **I**, Template by **T**, Structure by **S** and enums by **E** :
    * class CEntityManager
    * class IComponent
    * template\<typename T> TContainer
    * struct SCreateInfo
    * enum EPlayerState
 * The pascal case is used for classes, structures, templates, functions and methods : 
    * CEntityManager, SEntityCreateInfo, TContainer, GetData etc.
 * The snake case is used for all variables and members
    * unsigned int hit_points, field_of_view
 * Static class members are prefixed by **s_**  : s_object_counter
 * Private class members are prefixed by **m_** : m_member
 * Pointers are always prefixed by **p** : p_player
    * If the pointer is a private class member, it's possible to mix both : mp_member
 * Functions or method returning boolean should ask a question : IsInvincible(), IsEnabled() etc.
 * Explicit names are better than cryptic names except if it's really obvious
 * The header file extension is .hpp
 * The source file extension is .cpp
 * The file extension for inline function implementation is .inl
 * .inl should be placed in a folder named "impl"
    
    #### Examples <div id="NamingExamples"></div>
    ```cpp
    // Class prefixed by C
    class CPlayer
    {
    public:
        
        // Pointer prefixed by p
        explicit CPlayer(const char* p_name);     
    
    private:
        
        // Member variable prefixed by m
        // Member variable in snake case
        std::string m_player_name;
    };
    ```
    
#### Documentation and comments <div id="Comments"></div>
* Comments must be clear and useful
* A code comment use //
* The documentation use ///
* The documentation generator is Doxygen
    #### Examples <div id="CommentsExamples"></div>
    ```cpp
    /// \brief Stores and manages all entities
    /// \class CEntityManager
    class CEntityManager
    {
    public:
    
        /// \brief  Returns the current amount of entities
        /// \return The current amount of entities
        std::size_t GetEntityCount() const;
        
    private:
        std::size_t m_entity_count; ///< The amount of entities
    };
    ```
* If a keyword like *static, virtual or explicit* is used, a comment should be add before the
implementation :   
    ```cpp
    // Declaration
    virtual void Foo(void);
    
    // Implementation
    /* virtual */ void Bar::Foo(void) {}
    ```
    
#### Const correctness <div id="ConstCorrectness"></div>
The *const-correctness* is necessary and strongly recommended because it makes the code more robust, clearer
and even more optimized without any drawback.
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
    * for(const auto& entity : entities)
    * auto* pointer = static_cast<char *>(data);
    * auto lambda = \[](){ /* code */ };
    * auto const_iterator = map.cbegin();  
* And all other keywords : override, final, explicit, constexpr etc.    

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

// Good (way better to read)
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
In ordinal engine, the main namespace is ord, and there is one namespace for each engine part :
```cpp
/// \namespace ord
namespace ord
{

/// \namespace core
namespace core
{

/* code */

} // !namespace

} // !namespace

// Curent available namespace :
// namespace ord;
// namespace ord::core;
// namespace ord::network;
// namespace ord::rendering;
```
Note that the use of the "using" keyword is not recommended.
 
#### Memory <div id="Memory"></div>
The memory is one of the main resources of the engine. And it's also easy to make a bad use of it.
Here're some advices :
* Any codes that allocates memory is in charge of its deallocation.
* Don't make useless copies, use references, constant references and the move semantic. 
* If you are handling pointers, don't hesitate to check if they're equal to nullptr (you can use assertions)
* Never break the memory alignment 
* Use engine allocators
