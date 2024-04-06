//input image functions
var loadFile = function (event, id) {
document
  .getElementById(id+"ok")
  .setAttribute(
    "class",
    "absolute peer-checked:visible top-2 right-2 p-1 bg-gray-200 rounded-full w-7 h-7 flex items-center justify-center hover:bg-green-500 hover:text-white cursor-pointer"
  );
  var output = document.getElementById(id+"img");

  output.src = URL.createObjectURL(event.target.files[0]);
  output.onload = function () {
    URL.revokeObjectURL(output.src); 
  };
};
