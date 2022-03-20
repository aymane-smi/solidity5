//PSDX-LICENSE-Identifier: MIT

pragma solidity ^0.5.12;

contract Struct{
    struct Todo{
        string Text;
        bool Completed;
    }

    Todo[] public todos;

    function create1(string memory _text) public{
        todos.push(Todo(_text, false));
    }
    function create2(string memory _text) public{
        todos.push(Todo(
            _text,
            false
        ));
    }
    function create3(string memory _text) public{
        Todo memory todo;
        todo.Text = _text;
        todo.Completed = false;
        todos.push(todo);
    }

    function get(uint index) public view returns(string memory , bool){
        Todo storage todo = todos[index];
        return (todo.Text, todo.Completed);
    }

    function update(string memory _text, uint index) public returns(string memory, bool){
        Todo storage todo = todos[index];
        todo.Text = _text;
        todo.Completed = !todo.Completed;
        return (todo.Text, todo.Completed);
    }
}