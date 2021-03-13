{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 pragma solidity ^0.4.8;\
\
import \{ Auction \} from './Auction.sol';\
\
contract AuctionFactory \{\
    address[] public auctions;\
\
    event AuctionCreated(address auctionContract, address owner, uint numAuctions, address[] allAuctions);\
\
    function AuctionFactory() \{\
    \}\
\
    function createAuction(uint bidIncrement, uint startBlock, uint endBlock, string ipfsHash) \{\
        Auction newAuction = new Auction(msg.sender, bidIncrement, startBlock, endBlock, ipfsHash);\
        auctions.push(newAuction);\
\
        AuctionCreated(newAuction, msg.sender, auctions.length, auctions);\
    \}\
\
    function allAuctions() constant returns (address[]) \{\
        return auctions;\
    \}\
\}\
}