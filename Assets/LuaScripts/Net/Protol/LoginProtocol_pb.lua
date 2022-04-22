--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local PlayerSaveProtocol_pb = require("Net.Protol.PlayerSaveProtocol_pb")
local _M = {}

_M.LOGINPACKETFLAG = protobuf.EnumDescriptor();
_M.LOGINPACKETFLAG_REDPACKET_ENUM = protobuf.EnumValueDescriptor();
_M.REQUESTLOGIN = protobuf.Descriptor();
_M.REQUESTLOGIN_NAME_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_PASSWORD_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_DEVICE_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_SYSTEM_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_LANGUAGE_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_GAME_VERSION_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_PACKET_NAME_FIELD = protobuf.FieldDescriptor();
_M.REQUESTLOGIN_PACKET_FLAG_FIELD = protobuf.FieldDescriptor();
_M.REQUESTPLAYERLIST = protobuf.Descriptor();
_M.REQUESTLOADPLAYER = protobuf.Descriptor();
_M.REQUESTLOADPLAYER_PLAYERID_FIELD = protobuf.FieldDescriptor();
_M.REQUESTCREATEPLAYER = protobuf.Descriptor();
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD = protobuf.FieldDescriptor();
_M.REQUESTCREATEPLAYER_NROLEID_FIELD = protobuf.FieldDescriptor();
_M.REQUESTCREATEPLAYER_NSTATE_FIELD = protobuf.FieldDescriptor();
_M.LOGINERROR = protobuf.Descriptor();
_M.LOGINERROR_ERRORCODE_FIELD = protobuf.FieldDescriptor();
_M.LOGINERROR_SERVERID_FIELD = protobuf.FieldDescriptor();
_M.LOGINERROR_NOTICE_FIELD = protobuf.FieldDescriptor();
_M.CREATEPLAYERERROR = protobuf.Descriptor();
_M.CREATEPLAYERERROR_ERRORCODE_FIELD = protobuf.FieldDescriptor();
_M.PLAYERREADY = protobuf.Descriptor();
_M.PLAYERREADY_RESULT_FIELD = protobuf.FieldDescriptor();
_M.BEGINLOADDATA = protobuf.Descriptor();
_M.BEGINLOADDATA_RESULT_FIELD = protobuf.FieldDescriptor();
_M.BEGINLOADDATA_CONFIGVERSION_FIELD = protobuf.FieldDescriptor();
_M.PLAYERLISTRESULT = protobuf.Descriptor();
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD = protobuf.FieldDescriptor();
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD = protobuf.FieldDescriptor();
_M.PLAYERMODULEDATA = protobuf.Descriptor();
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD = protobuf.FieldDescriptor();

_M.LOGINPACKETFLAG_REDPACKET_ENUM.name = "RedPacket"
_M.LOGINPACKETFLAG_REDPACKET_ENUM.index = 0
_M.LOGINPACKETFLAG_REDPACKET_ENUM.number = 1
_M.LOGINPACKETFLAG.name = "LoginPacketFlag"
_M.LOGINPACKETFLAG.full_name = ".LoginProtocol.LoginPacketFlag"
_M.LOGINPACKETFLAG.values = {_M.LOGINPACKETFLAG_REDPACKET_ENUM}
_M.REQUESTLOGIN_NAME_FIELD.name = "name"
_M.REQUESTLOGIN_NAME_FIELD.full_name = ".LoginProtocol.RequestLogin.name"
_M.REQUESTLOGIN_NAME_FIELD.number = 1
_M.REQUESTLOGIN_NAME_FIELD.index = 0
_M.REQUESTLOGIN_NAME_FIELD.label = 2
_M.REQUESTLOGIN_NAME_FIELD.has_default_value = false
_M.REQUESTLOGIN_NAME_FIELD.default_value = ""
_M.REQUESTLOGIN_NAME_FIELD.type = 9
_M.REQUESTLOGIN_NAME_FIELD.cpp_type = 9

_M.REQUESTLOGIN_PASSWORD_FIELD.name = "password"
_M.REQUESTLOGIN_PASSWORD_FIELD.full_name = ".LoginProtocol.RequestLogin.password"
_M.REQUESTLOGIN_PASSWORD_FIELD.number = 2
_M.REQUESTLOGIN_PASSWORD_FIELD.index = 1
_M.REQUESTLOGIN_PASSWORD_FIELD.label = 2
_M.REQUESTLOGIN_PASSWORD_FIELD.has_default_value = false
_M.REQUESTLOGIN_PASSWORD_FIELD.default_value = ""
_M.REQUESTLOGIN_PASSWORD_FIELD.type = 9
_M.REQUESTLOGIN_PASSWORD_FIELD.cpp_type = 9

_M.REQUESTLOGIN_DEVICE_FIELD.name = "device"
_M.REQUESTLOGIN_DEVICE_FIELD.full_name = ".LoginProtocol.RequestLogin.device"
_M.REQUESTLOGIN_DEVICE_FIELD.number = 3
_M.REQUESTLOGIN_DEVICE_FIELD.index = 2
_M.REQUESTLOGIN_DEVICE_FIELD.label = 2
_M.REQUESTLOGIN_DEVICE_FIELD.has_default_value = false
_M.REQUESTLOGIN_DEVICE_FIELD.default_value = ""
_M.REQUESTLOGIN_DEVICE_FIELD.type = 9
_M.REQUESTLOGIN_DEVICE_FIELD.cpp_type = 9

_M.REQUESTLOGIN_SYSTEM_FIELD.name = "system"
_M.REQUESTLOGIN_SYSTEM_FIELD.full_name = ".LoginProtocol.RequestLogin.system"
_M.REQUESTLOGIN_SYSTEM_FIELD.number = 4
_M.REQUESTLOGIN_SYSTEM_FIELD.index = 3
_M.REQUESTLOGIN_SYSTEM_FIELD.label = 2
_M.REQUESTLOGIN_SYSTEM_FIELD.has_default_value = false
_M.REQUESTLOGIN_SYSTEM_FIELD.default_value = ""
_M.REQUESTLOGIN_SYSTEM_FIELD.type = 9
_M.REQUESTLOGIN_SYSTEM_FIELD.cpp_type = 9

_M.REQUESTLOGIN_LANGUAGE_FIELD.name = "language"
_M.REQUESTLOGIN_LANGUAGE_FIELD.full_name = ".LoginProtocol.RequestLogin.language"
_M.REQUESTLOGIN_LANGUAGE_FIELD.number = 5
_M.REQUESTLOGIN_LANGUAGE_FIELD.index = 4
_M.REQUESTLOGIN_LANGUAGE_FIELD.label = 2
_M.REQUESTLOGIN_LANGUAGE_FIELD.has_default_value = false
_M.REQUESTLOGIN_LANGUAGE_FIELD.default_value = ""
_M.REQUESTLOGIN_LANGUAGE_FIELD.type = 9
_M.REQUESTLOGIN_LANGUAGE_FIELD.cpp_type = 9

_M.REQUESTLOGIN_GAME_VERSION_FIELD.name = "game_version"
_M.REQUESTLOGIN_GAME_VERSION_FIELD.full_name = ".LoginProtocol.RequestLogin.game_version"
_M.REQUESTLOGIN_GAME_VERSION_FIELD.number = 6
_M.REQUESTLOGIN_GAME_VERSION_FIELD.index = 5
_M.REQUESTLOGIN_GAME_VERSION_FIELD.label = 2
_M.REQUESTLOGIN_GAME_VERSION_FIELD.has_default_value = false
_M.REQUESTLOGIN_GAME_VERSION_FIELD.default_value = 0
_M.REQUESTLOGIN_GAME_VERSION_FIELD.type = 13
_M.REQUESTLOGIN_GAME_VERSION_FIELD.cpp_type = 3

_M.REQUESTLOGIN_PACKET_NAME_FIELD.name = "packet_name"
_M.REQUESTLOGIN_PACKET_NAME_FIELD.full_name = ".LoginProtocol.RequestLogin.packet_name"
_M.REQUESTLOGIN_PACKET_NAME_FIELD.number = 7
_M.REQUESTLOGIN_PACKET_NAME_FIELD.index = 6
_M.REQUESTLOGIN_PACKET_NAME_FIELD.label = 1
_M.REQUESTLOGIN_PACKET_NAME_FIELD.has_default_value = false
_M.REQUESTLOGIN_PACKET_NAME_FIELD.default_value = ""
_M.REQUESTLOGIN_PACKET_NAME_FIELD.type = 9
_M.REQUESTLOGIN_PACKET_NAME_FIELD.cpp_type = 9

_M.REQUESTLOGIN_PACKET_FLAG_FIELD.name = "packet_flag"
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.full_name = ".LoginProtocol.RequestLogin.packet_flag"
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.number = 8
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.index = 7
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.label = 1
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.has_default_value = false
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.default_value = 0
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.type = 13
_M.REQUESTLOGIN_PACKET_FLAG_FIELD.cpp_type = 3

_M.REQUESTLOGIN.name = "RequestLogin"
_M.REQUESTLOGIN.full_name = ".LoginProtocol.RequestLogin"
_M.REQUESTLOGIN.nested_types = {}
_M.REQUESTLOGIN.enum_types = {}
_M.REQUESTLOGIN.fields = {_M.REQUESTLOGIN_NAME_FIELD, _M.REQUESTLOGIN_PASSWORD_FIELD, _M.REQUESTLOGIN_DEVICE_FIELD, _M.REQUESTLOGIN_SYSTEM_FIELD, _M.REQUESTLOGIN_LANGUAGE_FIELD, _M.REQUESTLOGIN_GAME_VERSION_FIELD, _M.REQUESTLOGIN_PACKET_NAME_FIELD, _M.REQUESTLOGIN_PACKET_FLAG_FIELD}
_M.REQUESTLOGIN.is_extendable = false
_M.REQUESTLOGIN.extensions = {}
_M.REQUESTPLAYERLIST.name = "RequestPlayerList"
_M.REQUESTPLAYERLIST.full_name = ".LoginProtocol.RequestPlayerList"
_M.REQUESTPLAYERLIST.nested_types = {}
_M.REQUESTPLAYERLIST.enum_types = {}
_M.REQUESTPLAYERLIST.fields = {}
_M.REQUESTPLAYERLIST.is_extendable = false
_M.REQUESTPLAYERLIST.extensions = {}
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.name = "playerId"
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.full_name = ".LoginProtocol.RequestLoadPlayer.playerId"
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.number = 1
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.index = 0
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.label = 2
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.has_default_value = false
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.default_value = 0
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.type = 4
_M.REQUESTLOADPLAYER_PLAYERID_FIELD.cpp_type = 4

_M.REQUESTLOADPLAYER.name = "RequestLoadPlayer"
_M.REQUESTLOADPLAYER.full_name = ".LoginProtocol.RequestLoadPlayer"
_M.REQUESTLOADPLAYER.nested_types = {}
_M.REQUESTLOADPLAYER.enum_types = {}
_M.REQUESTLOADPLAYER.fields = {_M.REQUESTLOADPLAYER_PLAYERID_FIELD}
_M.REQUESTLOADPLAYER.is_extendable = false
_M.REQUESTLOADPLAYER.extensions = {}
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.name = "sCharName"
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.full_name = ".LoginProtocol.RequestCreatePlayer.sCharName"
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.number = 1
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.index = 0
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.label = 2
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.has_default_value = false
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.default_value = ""
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.type = 9
_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD.cpp_type = 9

_M.REQUESTCREATEPLAYER_NROLEID_FIELD.name = "nRoleId"
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.full_name = ".LoginProtocol.RequestCreatePlayer.nRoleId"
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.number = 2
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.index = 1
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.label = 2
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.has_default_value = false
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.default_value = 0
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.type = 13
_M.REQUESTCREATEPLAYER_NROLEID_FIELD.cpp_type = 3

_M.REQUESTCREATEPLAYER_NSTATE_FIELD.name = "nState"
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.full_name = ".LoginProtocol.RequestCreatePlayer.nState"
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.number = 3
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.index = 2
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.label = 2
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.has_default_value = false
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.default_value = 0
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.type = 13
_M.REQUESTCREATEPLAYER_NSTATE_FIELD.cpp_type = 3

_M.REQUESTCREATEPLAYER.name = "RequestCreatePlayer"
_M.REQUESTCREATEPLAYER.full_name = ".LoginProtocol.RequestCreatePlayer"
_M.REQUESTCREATEPLAYER.nested_types = {}
_M.REQUESTCREATEPLAYER.enum_types = {}
_M.REQUESTCREATEPLAYER.fields = {_M.REQUESTCREATEPLAYER_SCHARNAME_FIELD, _M.REQUESTCREATEPLAYER_NROLEID_FIELD, _M.REQUESTCREATEPLAYER_NSTATE_FIELD}
_M.REQUESTCREATEPLAYER.is_extendable = false
_M.REQUESTCREATEPLAYER.extensions = {}
_M.LOGINERROR_ERRORCODE_FIELD.name = "errorCode"
_M.LOGINERROR_ERRORCODE_FIELD.full_name = ".LoginProtocol.LoginError.errorCode"
_M.LOGINERROR_ERRORCODE_FIELD.number = 1
_M.LOGINERROR_ERRORCODE_FIELD.index = 0
_M.LOGINERROR_ERRORCODE_FIELD.label = 2
_M.LOGINERROR_ERRORCODE_FIELD.has_default_value = false
_M.LOGINERROR_ERRORCODE_FIELD.default_value = 0
_M.LOGINERROR_ERRORCODE_FIELD.type = 13
_M.LOGINERROR_ERRORCODE_FIELD.cpp_type = 3

_M.LOGINERROR_SERVERID_FIELD.name = "serverId"
_M.LOGINERROR_SERVERID_FIELD.full_name = ".LoginProtocol.LoginError.serverId"
_M.LOGINERROR_SERVERID_FIELD.number = 2
_M.LOGINERROR_SERVERID_FIELD.index = 1
_M.LOGINERROR_SERVERID_FIELD.label = 2
_M.LOGINERROR_SERVERID_FIELD.has_default_value = false
_M.LOGINERROR_SERVERID_FIELD.default_value = 0
_M.LOGINERROR_SERVERID_FIELD.type = 13
_M.LOGINERROR_SERVERID_FIELD.cpp_type = 3

_M.LOGINERROR_NOTICE_FIELD.name = "notice"
_M.LOGINERROR_NOTICE_FIELD.full_name = ".LoginProtocol.LoginError.notice"
_M.LOGINERROR_NOTICE_FIELD.number = 3
_M.LOGINERROR_NOTICE_FIELD.index = 2
_M.LOGINERROR_NOTICE_FIELD.label = 1
_M.LOGINERROR_NOTICE_FIELD.has_default_value = false
_M.LOGINERROR_NOTICE_FIELD.default_value = ""
_M.LOGINERROR_NOTICE_FIELD.type = 9
_M.LOGINERROR_NOTICE_FIELD.cpp_type = 9

_M.LOGINERROR.name = "LoginError"
_M.LOGINERROR.full_name = ".LoginProtocol.LoginError"
_M.LOGINERROR.nested_types = {}
_M.LOGINERROR.enum_types = {}
_M.LOGINERROR.fields = {_M.LOGINERROR_ERRORCODE_FIELD, _M.LOGINERROR_SERVERID_FIELD, _M.LOGINERROR_NOTICE_FIELD}
_M.LOGINERROR.is_extendable = false
_M.LOGINERROR.extensions = {}
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.name = "errorCode"
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.full_name = ".LoginProtocol.CreatePlayerError.errorCode"
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.number = 1
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.index = 0
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.label = 2
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.has_default_value = false
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.default_value = 0
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.type = 13
_M.CREATEPLAYERERROR_ERRORCODE_FIELD.cpp_type = 3

_M.CREATEPLAYERERROR.name = "CreatePlayerError"
_M.CREATEPLAYERERROR.full_name = ".LoginProtocol.CreatePlayerError"
_M.CREATEPLAYERERROR.nested_types = {}
_M.CREATEPLAYERERROR.enum_types = {}
_M.CREATEPLAYERERROR.fields = {_M.CREATEPLAYERERROR_ERRORCODE_FIELD}
_M.CREATEPLAYERERROR.is_extendable = false
_M.CREATEPLAYERERROR.extensions = {}
_M.PLAYERREADY_RESULT_FIELD.name = "result"
_M.PLAYERREADY_RESULT_FIELD.full_name = ".LoginProtocol.PlayerReady.result"
_M.PLAYERREADY_RESULT_FIELD.number = 1
_M.PLAYERREADY_RESULT_FIELD.index = 0
_M.PLAYERREADY_RESULT_FIELD.label = 2
_M.PLAYERREADY_RESULT_FIELD.has_default_value = false
_M.PLAYERREADY_RESULT_FIELD.default_value = 0
_M.PLAYERREADY_RESULT_FIELD.type = 13
_M.PLAYERREADY_RESULT_FIELD.cpp_type = 3

_M.PLAYERREADY.name = "PlayerReady"
_M.PLAYERREADY.full_name = ".LoginProtocol.PlayerReady"
_M.PLAYERREADY.nested_types = {}
_M.PLAYERREADY.enum_types = {}
_M.PLAYERREADY.fields = {_M.PLAYERREADY_RESULT_FIELD}
_M.PLAYERREADY.is_extendable = false
_M.PLAYERREADY.extensions = {}
_M.BEGINLOADDATA_RESULT_FIELD.name = "result"
_M.BEGINLOADDATA_RESULT_FIELD.full_name = ".LoginProtocol.BeginLoadData.result"
_M.BEGINLOADDATA_RESULT_FIELD.number = 1
_M.BEGINLOADDATA_RESULT_FIELD.index = 0
_M.BEGINLOADDATA_RESULT_FIELD.label = 2
_M.BEGINLOADDATA_RESULT_FIELD.has_default_value = false
_M.BEGINLOADDATA_RESULT_FIELD.default_value = 0
_M.BEGINLOADDATA_RESULT_FIELD.type = 13
_M.BEGINLOADDATA_RESULT_FIELD.cpp_type = 3

_M.BEGINLOADDATA_CONFIGVERSION_FIELD.name = "configVersion"
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.full_name = ".LoginProtocol.BeginLoadData.configVersion"
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.number = 2
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.index = 1
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.label = 1
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.has_default_value = false
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.default_value = 0
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.type = 13
_M.BEGINLOADDATA_CONFIGVERSION_FIELD.cpp_type = 3

_M.BEGINLOADDATA.name = "BeginLoadData"
_M.BEGINLOADDATA.full_name = ".LoginProtocol.BeginLoadData"
_M.BEGINLOADDATA.nested_types = {}
_M.BEGINLOADDATA.enum_types = {}
_M.BEGINLOADDATA.fields = {_M.BEGINLOADDATA_RESULT_FIELD, _M.BEGINLOADDATA_CONFIGVERSION_FIELD}
_M.BEGINLOADDATA.is_extendable = false
_M.BEGINLOADDATA.extensions = {}
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.name = "player_list_result"
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.full_name = ".LoginProtocol.PlayerListResult.player_list_result"
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.number = 1
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.index = 0
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.label = 2
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.has_default_value = false
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.default_value = nil
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.message_type = PlayerSaveProtocol_pb.PLAYERLIST
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.type = 11
_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD.cpp_type = 10

_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.name = "recommondState"
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.full_name = ".LoginProtocol.PlayerListResult.recommondState"
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.number = 2
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.index = 1
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.label = 1
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.has_default_value = false
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.default_value = 0
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.type = 13
_M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD.cpp_type = 3

_M.PLAYERLISTRESULT.name = "PlayerListResult"
_M.PLAYERLISTRESULT.full_name = ".LoginProtocol.PlayerListResult"
_M.PLAYERLISTRESULT.nested_types = {}
_M.PLAYERLISTRESULT.enum_types = {}
_M.PLAYERLISTRESULT.fields = {_M.PLAYERLISTRESULT_PLAYER_LIST_RESULT_FIELD, _M.PLAYERLISTRESULT_RECOMMONDSTATE_FIELD}
_M.PLAYERLISTRESULT.is_extendable = false
_M.PLAYERLISTRESULT.extensions = {}
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.name = "player_module_data"
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.full_name = ".LoginProtocol.PlayerModuleData.player_module_data"
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.number = 1
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.index = 0
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.label = 2
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.has_default_value = false
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.default_value = nil
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.message_type = PlayerSaveProtocol_pb.PLAYERMODULEDATA
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.type = 11
_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD.cpp_type = 10

_M.PLAYERMODULEDATA.name = "PlayerModuleData"
_M.PLAYERMODULEDATA.full_name = ".LoginProtocol.PlayerModuleData"
_M.PLAYERMODULEDATA.nested_types = {}
_M.PLAYERMODULEDATA.enum_types = {}
_M.PLAYERMODULEDATA.fields = {_M.PLAYERMODULEDATA_PLAYER_MODULE_DATA_FIELD}
_M.PLAYERMODULEDATA.is_extendable = false
_M.PLAYERMODULEDATA.extensions = {}

RedPacket = 1
_M.BeginLoadData = protobuf.Message(_M.BEGINLOADDATA)
_M.CreatePlayerError = protobuf.Message(_M.CREATEPLAYERERROR)
_M.LoginError = protobuf.Message(_M.LOGINERROR)
_M.PlayerListResult = protobuf.Message(_M.PLAYERLISTRESULT)
_M.PlayerModuleData = protobuf.Message(_M.PLAYERMODULEDATA)
_M.PlayerReady = protobuf.Message(_M.PLAYERREADY)
_M.RequestCreatePlayer = protobuf.Message(_M.REQUESTCREATEPLAYER)
_M.RequestLoadPlayer = protobuf.Message(_M.REQUESTLOADPLAYER)
_M.RequestLogin = protobuf.Message(_M.REQUESTLOGIN)
_M.RequestPlayerList = protobuf.Message(_M.REQUESTPLAYERLIST)

return _M