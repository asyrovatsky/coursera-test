(function(){
  angular.module('MenuApp')
    .controller('ItemsController', ItemsController);

  ItemsController.$injects = ['items', '$stateParams'];

  function ItemsController(items, $stateParams){
    this.items = items;
  }

})();