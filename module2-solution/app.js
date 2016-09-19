(function(){ 'use strict';
  angular.module('ShoppingListCheckOff',[])
  .controller('ToBuyShoppingController', ToBuyShoppingController)
  .controller('AlreadyBoughtShoppingController', AlreadyBoughtShoppingController)
  .service('ShoppingListCheckOffService', ShoppingListCheckOffService);

  ToBuyShoppingController.$inject = ['ShoppingListCheckOffService'];
  AlreadyBoughtShoppingController.$inject = ['ShoppingListCheckOffService'];

  function ToBuyShoppingController(listService){
    this.items = listService.getToBuyItems();

    this.bougthBtnClick = function(index){
      listService.boughtHandler(index);
    };
  };

  function AlreadyBoughtShoppingController(listService){
    this.items = listService.getBoughtItems();
  };

  function ShoppingListCheckOffService(){
    this.listService = this;
    this.toBuyItems = [
      {
        name: "cookies",
        quantity: 10
      },
      {
        name: "snacks",
        quantity: 5
      },
      {
        name: "apples",
        quantity: 2
      },
      {
        name: "coffee",
        quantity: 1
      },
      {
        name: "bear",
        quantity: 1
      }
    ];
    this.bougthItems = [];

    this.boughtHandler = function(index){
      this.listService.bougthItems.push(this.toBuyItems.splice(index,1)[0]);
    };

    this.getToBuyItems = function(){
      return this.listService.toBuyItems;
    };

    this.getBoughtItems = function(){
      return this.listService.bougthItems;
    };
  };
})();
