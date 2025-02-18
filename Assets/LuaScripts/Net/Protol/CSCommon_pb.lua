--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local _M = {}

_M.CSPROTOCMD = protobuf.EnumDescriptor();
_M.CSPROTOCMD_LOGIN_ENUM = protobuf.EnumValueDescriptor();
_M.CSPROTOCMD_PLAYER_ENUM = protobuf.EnumValueDescriptor();
_M.CSPROTOCMD_SCENE_ENUM = protobuf.EnumValueDescriptor();
_M.CSPROTOCMD_GATE_ENUM = protobuf.EnumValueDescriptor();
_M.C2SLOGINPROTOCOL = protobuf.EnumDescriptor();
_M.C2SLOGINPROTOCOL_CMDREQUESTLOGIN_ENUM = protobuf.EnumValueDescriptor();
_M.C2SLOGINPROTOCOL_CMDREQUESTPLAYERLIST_ENUM = protobuf.EnumValueDescriptor();
_M.C2SLOGINPROTOCOL_CMDREQUESTLOADPLAYER_ENUM = protobuf.EnumValueDescriptor();
_M.C2SLOGINPROTOCOL_CMDREQUESTCREATEPLAYER_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL = protobuf.EnumDescriptor();
_M.S2CLOGINPROTOCOL_CMDLOGINERROR_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL_CMDPLAYERREADY_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL_CMDPLAYERLISTRESULT_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL_CMDPLAYERMODULEDATA_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL_CMDBEGINLOADDATA_ENUM = protobuf.EnumValueDescriptor();
_M.S2CLOGINPROTOCOL_CMDCREATEPLAYERERROR_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL = protobuf.EnumDescriptor();
_M.C2SPLAYERPROTOCOL_CMDHEARTBEAT_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDTALKMSG_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDREQTALKHISTORY_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDCHANGENAME_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDCHANGEHEAD_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDREQVIEWPLAYERINFO_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDREQSERVERTIME_ENUM = protobuf.EnumValueDescriptor();
_M.C2SPLAYERPROTOCOL_CMDREQLOGINTOKEN_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL = protobuf.EnumDescriptor();
_M.S2CPLAYERPROTOCOL_CMDRETTALKMSG_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCSERVERTIME_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCNOTICE_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDERRORCODE_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDRETTALKHISTORY_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDNEWTALKMSG_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCCHATABANDON_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCMARQUEENOTICE_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCLOGINTOKEN_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCSYSTEMTIP_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDSYNCPLAYERBASEDATA_ENUM = protobuf.EnumValueDescriptor();
_M.S2CPLAYERPROTOCOL_CMDRETVIEWPLAYERINFO_ENUM = protobuf.EnumValueDescriptor();

_M.CSPROTOCMD_LOGIN_ENUM.name = "Login"
_M.CSPROTOCMD_LOGIN_ENUM.index = 0
_M.CSPROTOCMD_LOGIN_ENUM.number = 1
_M.CSPROTOCMD_PLAYER_ENUM.name = "Player"
_M.CSPROTOCMD_PLAYER_ENUM.index = 1
_M.CSPROTOCMD_PLAYER_ENUM.number = 2
_M.CSPROTOCMD_SCENE_ENUM.name = "Scene"
_M.CSPROTOCMD_SCENE_ENUM.index = 2
_M.CSPROTOCMD_SCENE_ENUM.number = 3
_M.CSPROTOCMD_GATE_ENUM.name = "Gate"
_M.CSPROTOCMD_GATE_ENUM.index = 3
_M.CSPROTOCMD_GATE_ENUM.number = 10
_M.CSPROTOCMD.name = "CSProtoCmd"
_M.CSPROTOCMD.full_name = ".CSCommon.CSProtoCmd"
_M.CSPROTOCMD.values = {_M.CSPROTOCMD_LOGIN_ENUM,_M.CSPROTOCMD_PLAYER_ENUM,_M.CSPROTOCMD_SCENE_ENUM,_M.CSPROTOCMD_GATE_ENUM}
_M.C2SLOGINPROTOCOL_CMDREQUESTLOGIN_ENUM.name = "CmdRequestLogin"
_M.C2SLOGINPROTOCOL_CMDREQUESTLOGIN_ENUM.index = 0
_M.C2SLOGINPROTOCOL_CMDREQUESTLOGIN_ENUM.number = 1
_M.C2SLOGINPROTOCOL_CMDREQUESTPLAYERLIST_ENUM.name = "CmdRequestPlayerList"
_M.C2SLOGINPROTOCOL_CMDREQUESTPLAYERLIST_ENUM.index = 1
_M.C2SLOGINPROTOCOL_CMDREQUESTPLAYERLIST_ENUM.number = 2
_M.C2SLOGINPROTOCOL_CMDREQUESTLOADPLAYER_ENUM.name = "CmdRequestLoadPlayer"
_M.C2SLOGINPROTOCOL_CMDREQUESTLOADPLAYER_ENUM.index = 2
_M.C2SLOGINPROTOCOL_CMDREQUESTLOADPLAYER_ENUM.number = 3
_M.C2SLOGINPROTOCOL_CMDREQUESTCREATEPLAYER_ENUM.name = "CmdRequestCreatePlayer"
_M.C2SLOGINPROTOCOL_CMDREQUESTCREATEPLAYER_ENUM.index = 3
_M.C2SLOGINPROTOCOL_CMDREQUESTCREATEPLAYER_ENUM.number = 4
_M.C2SLOGINPROTOCOL.name = "C2SLoginProtocol"
_M.C2SLOGINPROTOCOL.full_name = ".CSCommon.C2SLoginProtocol"
_M.C2SLOGINPROTOCOL.values = {_M.C2SLOGINPROTOCOL_CMDREQUESTLOGIN_ENUM,_M.C2SLOGINPROTOCOL_CMDREQUESTPLAYERLIST_ENUM,_M.C2SLOGINPROTOCOL_CMDREQUESTLOADPLAYER_ENUM,_M.C2SLOGINPROTOCOL_CMDREQUESTCREATEPLAYER_ENUM}
_M.S2CLOGINPROTOCOL_CMDLOGINERROR_ENUM.name = "CmdLoginError"
_M.S2CLOGINPROTOCOL_CMDLOGINERROR_ENUM.index = 0
_M.S2CLOGINPROTOCOL_CMDLOGINERROR_ENUM.number = 1
_M.S2CLOGINPROTOCOL_CMDPLAYERREADY_ENUM.name = "CmdPlayerReady"
_M.S2CLOGINPROTOCOL_CMDPLAYERREADY_ENUM.index = 1
_M.S2CLOGINPROTOCOL_CMDPLAYERREADY_ENUM.number = 2
_M.S2CLOGINPROTOCOL_CMDPLAYERLISTRESULT_ENUM.name = "CmdPlayerListResult"
_M.S2CLOGINPROTOCOL_CMDPLAYERLISTRESULT_ENUM.index = 2
_M.S2CLOGINPROTOCOL_CMDPLAYERLISTRESULT_ENUM.number = 3
_M.S2CLOGINPROTOCOL_CMDPLAYERMODULEDATA_ENUM.name = "CmdPlayerModuleData"
_M.S2CLOGINPROTOCOL_CMDPLAYERMODULEDATA_ENUM.index = 3
_M.S2CLOGINPROTOCOL_CMDPLAYERMODULEDATA_ENUM.number = 4
_M.S2CLOGINPROTOCOL_CMDBEGINLOADDATA_ENUM.name = "CmdBeginLoadData"
_M.S2CLOGINPROTOCOL_CMDBEGINLOADDATA_ENUM.index = 4
_M.S2CLOGINPROTOCOL_CMDBEGINLOADDATA_ENUM.number = 5
_M.S2CLOGINPROTOCOL_CMDCREATEPLAYERERROR_ENUM.name = "CmdCreatePlayerError"
_M.S2CLOGINPROTOCOL_CMDCREATEPLAYERERROR_ENUM.index = 5
_M.S2CLOGINPROTOCOL_CMDCREATEPLAYERERROR_ENUM.number = 6
_M.S2CLOGINPROTOCOL.name = "S2CLoginProtocol"
_M.S2CLOGINPROTOCOL.full_name = ".CSCommon.S2CLoginProtocol"
_M.S2CLOGINPROTOCOL.values = {_M.S2CLOGINPROTOCOL_CMDLOGINERROR_ENUM,_M.S2CLOGINPROTOCOL_CMDPLAYERREADY_ENUM,_M.S2CLOGINPROTOCOL_CMDPLAYERLISTRESULT_ENUM,_M.S2CLOGINPROTOCOL_CMDPLAYERMODULEDATA_ENUM,_M.S2CLOGINPROTOCOL_CMDBEGINLOADDATA_ENUM,_M.S2CLOGINPROTOCOL_CMDCREATEPLAYERERROR_ENUM}
_M.C2SPLAYERPROTOCOL_CMDHEARTBEAT_ENUM.name = "CmdHeartBeat"
_M.C2SPLAYERPROTOCOL_CMDHEARTBEAT_ENUM.index = 0
_M.C2SPLAYERPROTOCOL_CMDHEARTBEAT_ENUM.number = 1
_M.C2SPLAYERPROTOCOL_CMDTALKMSG_ENUM.name = "CmdTalkMsg"
_M.C2SPLAYERPROTOCOL_CMDTALKMSG_ENUM.index = 1
_M.C2SPLAYERPROTOCOL_CMDTALKMSG_ENUM.number = 2
_M.C2SPLAYERPROTOCOL_CMDREQTALKHISTORY_ENUM.name = "CmdReqTalkHistory"
_M.C2SPLAYERPROTOCOL_CMDREQTALKHISTORY_ENUM.index = 2
_M.C2SPLAYERPROTOCOL_CMDREQTALKHISTORY_ENUM.number = 3
_M.C2SPLAYERPROTOCOL_CMDCHANGENAME_ENUM.name = "CmdChangeName"
_M.C2SPLAYERPROTOCOL_CMDCHANGENAME_ENUM.index = 3
_M.C2SPLAYERPROTOCOL_CMDCHANGENAME_ENUM.number = 5
_M.C2SPLAYERPROTOCOL_CMDCHANGEHEAD_ENUM.name = "CmdChangeHead"
_M.C2SPLAYERPROTOCOL_CMDCHANGEHEAD_ENUM.index = 4
_M.C2SPLAYERPROTOCOL_CMDCHANGEHEAD_ENUM.number = 6
_M.C2SPLAYERPROTOCOL_CMDREQVIEWPLAYERINFO_ENUM.name = "CmdReqViewPlayerInfo"
_M.C2SPLAYERPROTOCOL_CMDREQVIEWPLAYERINFO_ENUM.index = 5
_M.C2SPLAYERPROTOCOL_CMDREQVIEWPLAYERINFO_ENUM.number = 7
_M.C2SPLAYERPROTOCOL_CMDREQSERVERTIME_ENUM.name = "CmdReqServerTime"
_M.C2SPLAYERPROTOCOL_CMDREQSERVERTIME_ENUM.index = 6
_M.C2SPLAYERPROTOCOL_CMDREQSERVERTIME_ENUM.number = 8
_M.C2SPLAYERPROTOCOL_CMDREQLOGINTOKEN_ENUM.name = "CmdReqLoginToken"
_M.C2SPLAYERPROTOCOL_CMDREQLOGINTOKEN_ENUM.index = 7
_M.C2SPLAYERPROTOCOL_CMDREQLOGINTOKEN_ENUM.number = 9
_M.C2SPLAYERPROTOCOL.name = "C2SPlayerProtocol"
_M.C2SPLAYERPROTOCOL.full_name = ".CSCommon.C2SPlayerProtocol"
_M.C2SPLAYERPROTOCOL.values = {_M.C2SPLAYERPROTOCOL_CMDHEARTBEAT_ENUM,_M.C2SPLAYERPROTOCOL_CMDTALKMSG_ENUM,_M.C2SPLAYERPROTOCOL_CMDREQTALKHISTORY_ENUM,_M.C2SPLAYERPROTOCOL_CMDCHANGENAME_ENUM,_M.C2SPLAYERPROTOCOL_CMDCHANGEHEAD_ENUM,_M.C2SPLAYERPROTOCOL_CMDREQVIEWPLAYERINFO_ENUM,_M.C2SPLAYERPROTOCOL_CMDREQSERVERTIME_ENUM,_M.C2SPLAYERPROTOCOL_CMDREQLOGINTOKEN_ENUM}
_M.S2CPLAYERPROTOCOL_CMDRETTALKMSG_ENUM.name = "CmdRetTalkMsg"
_M.S2CPLAYERPROTOCOL_CMDRETTALKMSG_ENUM.index = 0
_M.S2CPLAYERPROTOCOL_CMDRETTALKMSG_ENUM.number = 1
_M.S2CPLAYERPROTOCOL_CMDSYNCSERVERTIME_ENUM.name = "CmdSyncServerTime"
_M.S2CPLAYERPROTOCOL_CMDSYNCSERVERTIME_ENUM.index = 1
_M.S2CPLAYERPROTOCOL_CMDSYNCSERVERTIME_ENUM.number = 2
_M.S2CPLAYERPROTOCOL_CMDSYNCNOTICE_ENUM.name = "CmdSyncNotice"
_M.S2CPLAYERPROTOCOL_CMDSYNCNOTICE_ENUM.index = 2
_M.S2CPLAYERPROTOCOL_CMDSYNCNOTICE_ENUM.number = 3
_M.S2CPLAYERPROTOCOL_CMDERRORCODE_ENUM.name = "CmdErrorCode"
_M.S2CPLAYERPROTOCOL_CMDERRORCODE_ENUM.index = 3
_M.S2CPLAYERPROTOCOL_CMDERRORCODE_ENUM.number = 5
_M.S2CPLAYERPROTOCOL_CMDRETTALKHISTORY_ENUM.name = "CmdRetTalkHistory"
_M.S2CPLAYERPROTOCOL_CMDRETTALKHISTORY_ENUM.index = 4
_M.S2CPLAYERPROTOCOL_CMDRETTALKHISTORY_ENUM.number = 8
_M.S2CPLAYERPROTOCOL_CMDNEWTALKMSG_ENUM.name = "CmdNewTalkMsg"
_M.S2CPLAYERPROTOCOL_CMDNEWTALKMSG_ENUM.index = 5
_M.S2CPLAYERPROTOCOL_CMDNEWTALKMSG_ENUM.number = 9
_M.S2CPLAYERPROTOCOL_CMDSYNCCHATABANDON_ENUM.name = "CmdSyncChatAbandon"
_M.S2CPLAYERPROTOCOL_CMDSYNCCHATABANDON_ENUM.index = 6
_M.S2CPLAYERPROTOCOL_CMDSYNCCHATABANDON_ENUM.number = 10
_M.S2CPLAYERPROTOCOL_CMDSYNCMARQUEENOTICE_ENUM.name = "CmdSyncMarqueeNotice"
_M.S2CPLAYERPROTOCOL_CMDSYNCMARQUEENOTICE_ENUM.index = 7
_M.S2CPLAYERPROTOCOL_CMDSYNCMARQUEENOTICE_ENUM.number = 11
_M.S2CPLAYERPROTOCOL_CMDSYNCLOGINTOKEN_ENUM.name = "CmdSyncLoginToken"
_M.S2CPLAYERPROTOCOL_CMDSYNCLOGINTOKEN_ENUM.index = 8
_M.S2CPLAYERPROTOCOL_CMDSYNCLOGINTOKEN_ENUM.number = 12
_M.S2CPLAYERPROTOCOL_CMDSYNCSYSTEMTIP_ENUM.name = "CmdSyncSystemTip"
_M.S2CPLAYERPROTOCOL_CMDSYNCSYSTEMTIP_ENUM.index = 9
_M.S2CPLAYERPROTOCOL_CMDSYNCSYSTEMTIP_ENUM.number = 13
_M.S2CPLAYERPROTOCOL_CMDSYNCPLAYERBASEDATA_ENUM.name = "CmdSyncPlayerBaseData"
_M.S2CPLAYERPROTOCOL_CMDSYNCPLAYERBASEDATA_ENUM.index = 10
_M.S2CPLAYERPROTOCOL_CMDSYNCPLAYERBASEDATA_ENUM.number = 15
_M.S2CPLAYERPROTOCOL_CMDRETVIEWPLAYERINFO_ENUM.name = "CmdRetViewPlayerInfo"
_M.S2CPLAYERPROTOCOL_CMDRETVIEWPLAYERINFO_ENUM.index = 11
_M.S2CPLAYERPROTOCOL_CMDRETVIEWPLAYERINFO_ENUM.number = 16
_M.S2CPLAYERPROTOCOL.name = "S2CPlayerProtocol"
_M.S2CPLAYERPROTOCOL.full_name = ".CSCommon.S2CPlayerProtocol"
_M.S2CPLAYERPROTOCOL.values = {_M.S2CPLAYERPROTOCOL_CMDRETTALKMSG_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCSERVERTIME_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCNOTICE_ENUM,_M.S2CPLAYERPROTOCOL_CMDERRORCODE_ENUM,_M.S2CPLAYERPROTOCOL_CMDRETTALKHISTORY_ENUM,_M.S2CPLAYERPROTOCOL_CMDNEWTALKMSG_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCCHATABANDON_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCMARQUEENOTICE_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCLOGINTOKEN_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCSYSTEMTIP_ENUM,_M.S2CPLAYERPROTOCOL_CMDSYNCPLAYERBASEDATA_ENUM,_M.S2CPLAYERPROTOCOL_CMDRETVIEWPLAYERINFO_ENUM}

_M.CmdBeginLoadData = 5
_M.CmdChangeHead = 6
_M.CmdChangeName = 5
_M.CmdCreatePlayerError = 6
_M.CmdErrorCode = 5
_M.CmdHeartBeat = 1
_M.CmdLoginError = 1
_M.CmdNewTalkMsg = 9
_M.CmdPlayerListResult = 3
_M.CmdPlayerModuleData = 4
_M.CmdPlayerReady = 2
_M.CmdReqLoginToken = 9
_M.CmdReqServerTime = 8
_M.CmdReqTalkHistory = 3
_M.CmdReqViewPlayerInfo = 7
_M.CmdRequestCreatePlayer = 4
_M.CmdRequestLoadPlayer = 3
_M.CmdRequestLogin = 1
_M.CmdRequestPlayerList = 2
_M.CmdRetTalkHistory = 8
_M.CmdRetTalkMsg = 1
_M.CmdRetViewPlayerInfo = 16
_M.CmdSyncChatAbandon = 10
_M.CmdSyncLoginToken = 12
_M.CmdSyncMarqueeNotice = 11
_M.CmdSyncNotice = 3
_M.CmdSyncPlayerBaseData = 15
_M.CmdSyncServerTime = 2
_M.CmdSyncSystemTip = 13
_M.CmdTalkMsg = 2
_M.Gate = 10
_M.Login = 1
_M.Player = 2
_M.Scene = 3

return _M