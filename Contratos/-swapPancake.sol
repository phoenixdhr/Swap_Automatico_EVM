// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <=0.9.0;

//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Router {
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts){}
}

contract swapPancake
{

  Router router = Router(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);   // Direccion en Testnet de Pancakeswap como contrato
  ERC20 WBNB_token = ERC20(0xae13d989daC2f0dEbFf460aC112a837C89BAa7cd); // Direccion en Testnet de WBNB como contrato
  ERC20 BUSD_token = ERC20(0x78867BbEeF44f2326bF8DDd1941a4439382EF2A7); // Direccion en Testnet de BUSD como contrato


  function swapBNBtoBUSD() external payable
  {
    address[] memory path = new address[](2);       // Se inicializa un array dinámico con una longitud inicial de 2 (0,1)
    path[0] = address(WBNB_token);  // Address en Testnet de WBNB
    path[1] = address(BUSD_token);  // Address en Testnet de BUSD

    router.swapExactETHForTokens{value: msg.value}(0,path, msg.sender, block.timestamp);  // Especificación del Swap
 } 


  function aprobarWBNB() private {
  WBNB_token.approve(address(this),9999999999999999999999999);   // Se autoriza al contrato hacer uso del fondo que se le deposita (para hacer swaps) 
  }


}