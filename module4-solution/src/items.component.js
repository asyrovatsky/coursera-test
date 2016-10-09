(function(){
  angular.module('MenuApp')
    .component('items', {
      templateUrl: 'src/items.html',
      bindings: {
        items: '<'
      }
    })
})();