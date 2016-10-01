(function(){ 'use strict';
  angular.module('NarrowItDownApp',[])
  .controller('NarrowItDownController', NarrowItDownController)
  .service('MenuSearchService', MenuSearchService)
  .directive('foundItems', FoundItems);


  NarrowItDownController.$inject = ['MenuSearchService'];

  function NarrowItDownController(searchService){
    var ctrl = this;
    this.found = [];
    this.searchTerm = '';
    this.nothingFound = false;

    this.getMatchedMenuItems = function(){
      searchService.getMatchedMenuItems(ctrl.searchTerm)
      .then(function(result){
        ctrl.found = result;
        ctrl.nothingFound = (result.length === 0);
      });
    };

    this.removeItem = function(index){
      ctrl.found.splice(index, 1);
    };

  }

  function FoundItems(){
    var ddo = {
      templateUrl: 'found_items.html',
      restrict: 'E',
      scope: {
        foundItems: '<',
        nothingFound: '<',
        onRemove: '&'
      }
    };

    return ddo;
  }



  MenuSearchService.$inject = ['$http'];

  function MenuSearchService($http){
     this.getMatchedMenuItems = function(searchTerm){
      return $http(
        {
          method: 'GET',
          url: 'https://davids-restaurant.herokuapp.com/menu_items.json'
        })
        .then(function (result) {
          // process result and only keep items that match
          var foundItems = [];
          if (!searchTerm.trim()){
            return foundItems;
          }
          for (var i = 0; i < result.data.menu_items.length; i++) {
            var item = result.data.menu_items[i];
            if (item["description"].indexOf(searchTerm) > -1){
              foundItems.push(item);
            }
          }
          // return processed items
          return foundItems;
        });
    }
  }

})();
