@ECHO OFF
REM ###########################################################################
REM  Copyright (c) 2014-2015 libbitcoin developers (see COPYING).
REM 
REM  Generate libbitcoin build artifacts from XML + GSL.
REM 
REM  This executes the iMatix GSL code generator.
REM  See https://github.com/imatix/gsl for details.
REM
REM  Direct GSL download https://www.nuget.org/api/v2/package/gsl/4.1.0.1
REM  Extract gsl.exe from package using NuGet's File > Export
REM ###########################################################################

REM Make directories for generated build artifacts.
if not exist libbitcoin             mkdir libbitcoin
if not exist libbitcoin-blockchain  mkdir libbitcoin-blockchain
if not exist libbitcoin-client      mkdir libbitcoin-client
if not exist libbitcoin-consensus   mkdir libbitcoin-consensus
if not exist libbitcoin-explorer    mkdir libbitcoin-explorer
if not exist libbitcoin-node        mkdir libbitcoin-node
if not exist libbitcoin-protocol    mkdir libbitcoin-protocol
if not exist libbitcoin-server      mkdir libbitcoin-server

del /q libbitcoin\*
del /q libbitcoin-blockchain\*
del /q libbitcoin-client\*
del /q libbitcoin-consensus\*
del /q libbitcoin-explorer\*
del /q libbitcoin-node\*
del /q libbitcoin-protocol\*
del /q libbitcoin-server\*

REM Generate build artifacts.
gsl -q generate.xml

REM Copy outputs to all repositories.
copy /b /y libbitcoin\*             ..\libbitcoin\
copy /b /y libbitcoin-blockchain\*  ..\libbitcoin-blockchain\
copy /b /y libbitcoin-client\*      ..\libbitcoin-client\
copy /b /y libbitcoin-consensus\*   ..\libbitcoin-consensus\
copy /b /y libbitcoin-explorer\*    ..\libbitcoin-explorer\
copy /b /y libbitcoin-node\*        ..\libbitcoin-node\
copy /b /y libbitcoin-protocol\*    ..\libbitcoin-protocol\
copy /b /y libbitcoin-server\*      ..\libbitcoin-server\

PAUSE
