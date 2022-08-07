```mermaid
classDiagram
class StateMachine{
    +State state
    -_init()
    -_ready()
    -_unhandled_input(event: InputEvent)
    -_physics_process()
    +transition_to(target_state_path, msg)

}
class State{
    -_state_machine ~StateMachine~
    -_parent ~State~
    -_ready()
    +unhandled_input( _event ~InputEvent~ )
    +physics_process( _delta ~float~ )
    +enter(_msg ~Dictionary~)
    +exit()
    -_get_state_machine(node ~Node~)
}
Node <|-- State 
PlayerShip "1" --> StateMachine
Node <|-- StateMachine
State <|-- PlayerState

class PlayerShip{
    +Inertial_System Inertial_System
    -Sprite Spaceship
    -CollisionPolygon2D CollisionPolygon2D 
    -StateMachine StateMachine
}
```
<!-- ```mermaid
classDiagram
class PlayerShip{
    +Inertial_System Inertial_System
    -Sprite Spaceship
    -CollisionPolygon2D CollisionPolygon2D 
    -StateMachine StateMachine
}

Node <|-- State 
Node <|-- StateMachine
State <|-- PlayerState


``` -->
```mermaid
classDiagram
Class01 <|-- AveryLongClass : Cool
Class03 *-- Class04
Class05 o-- Class06
Class07 .. Class08
Class09 --> C2 : Where am i?
Class09 --* C3
Class09 --|> Class07
Class07 : equals()
Class07 : Object[] elementData
Class01 : size()
Class01 : int chimp
Class01 : int gorilla
Class08 <--> C2: Cool label

```
