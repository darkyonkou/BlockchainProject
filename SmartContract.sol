pragma solidity ^0.8.6;

contract TaskCrud {
    
    struct Task {
        uint id;
        string nombre;
        string descripcion;
    }
    
    Task[] tareas;
    uint siguientId; // default value 0, add public to see the value
    
    function crearTask(string memory _nombre, string memory _descripcion) public {
        tareas.push(Task(siguientId, _nombre, _descripcion));
        siguientId++;
    }
    
    
    function buscaIndex(uint _id) internal view returns (uint) { // funcion encargada de buscar una tarea especifica
        for (uint i = 0; i < tareas.length; i++) {
            if (tareas[i].id == _id) {
                return i;
            }
        }
        revert("La tarea no se encontro");
    }
    
    function actualizaTask(uint _id, string memory _nombre, string memory _descripcion) public { // funcion encargada de actualizar una tarea especifica
        uint index = buscaIndex(_id);
        tareas[index].nombre = _nombre;
        tareas[index].descripcion = _descripcion;
    }
    
    function readTask(uint _id) public view returns (uint, string memory, string memory) {
        uint index = buscaIndex(_id);
        return (tareas[index].id, tareas[index].nombre, tareas[index].descripcion);
    }
    
    function eliminaTask(uint _id) public { // funcion encargada de eliminar una tarea especifica
        uint index = buscaIndex(_id);
        delete tareas[index];
    }
    
}