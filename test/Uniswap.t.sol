// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {UniswapV2Router02} from "../src/UniswapV2Router02.sol";
import { UniswapV2Factory } from "../src/UniswapV2Factory.sol";
import { WETH9 } from "../src/WETH9.sol";
import "forge-std/console.sol";

contract CounterTest is Test {
    UniswapV2Router02 public _uniswapV2;
    UniswapV2Factory public _uniswapFactory;
    WETH9 public _weth;
    address public _feeToSetter = 0xd6C9BBeb0AbfFC8C8978701035F8cA84750A3C75;
    address public marketWallet = 0x5082287146Dbd0B0265bB76973697602BB2DAC21;

    function setUp() public {
        _uniswapFactory = new UniswapV2Factory(_feeToSetter);
        _weth = new WETH9();
        _uniswapV2 = new UniswapV2Router02(address(_uniswapFactory), address(_weth));
    }

    function testDemo() public view {
        console.logAddress(address(_uniswapV2));
    }

    function test_weth_supply() public {
        // vm.deal(address(_weth), 100000000);
        address(_weth).call{value: 20000}("");
        uint t = _weth.totalSupply();
        console.logUint(t);
    }
}
