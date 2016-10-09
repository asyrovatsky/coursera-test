(function(){
  angular.module('MenuApp')
    .component('categories', {
      templateUrl: 'src/categories.html',
      bindings: {
        categories: '<'
      }
    })
})();