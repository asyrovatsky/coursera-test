(function(){
  
  angular.module('MenuApp')
    .config(RoutesConfig);

  RoutesConfig.$inject = ['$stateProvider', '$urlRouterProvider'];
  function RoutesConfig($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise('/');

    // Set up UI states
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'src/home.html'
      })

      .state('categories', {
        url: '/categories',
        templateUrl: 'src/page.categories.template.html',
        controller: 'CategoriesController as ctrl',
        resolve: {
          categories: ['MenuDataService', function(dataService){
            return dataService.getAllCategories();
          }]
        }
      })
      .state('items', {
        url: '/items/{category}',
        templateUrl: 'src/page.items.template.html',
        controller: 'ItemsController as ctrl',
        resolve: {
          items: ['$stateParams', 'MenuDataService', function ($stateParams, dataService) {
            return dataService.getItemsForCategory($stateParams.category);
          }]
        }
      });
  }
  
})();