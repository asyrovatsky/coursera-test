(function(){
  angular.module('MenuApp')
    .controller('CategoriesController', CategoriesController);

  CategoriesController.$injects = ['categories'];

  function CategoriesController(categories){
    this.categories = categories;
  }

})();