--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local _M = {}

_M.C2SSCENEPROTOCOL = protobuf.EnumDescriptor();
_M.C2SSCENEPROTOCOL_TEST_ENUM = protobuf.EnumValueDescriptor();
_M.S2CSCENEPROTOCOL = protobuf.EnumDescriptor();
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM = protobuf.EnumValueDescriptor();
_M.SCENEEVENTTYPE = protobuf.EnumDescriptor();
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM = protobuf.EnumValueDescriptor();
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM = protobuf.EnumValueDescriptor();
_M.ENTITYPOS = protobuf.Descriptor();
_M.ENTITYPOS_POSX_FIELD = protobuf.FieldDescriptor();
_M.ENTITYPOS_POSY_FIELD = protobuf.FieldDescriptor();
_M.ENTITYPOS_POSZ_FIELD = protobuf.FieldDescriptor();
_M.STATEBEHAVIOR = protobuf.Descriptor();
_M.STATEBEHAVIOR_STATE_FIELD = protobuf.FieldDescriptor();
_M.STATEBEHAVIOR_TARGETPOS_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA = protobuf.Descriptor();
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_ACTORID_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_CURPOS_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD = protobuf.FieldDescriptor();
_M.SCENEENTITYINFO = protobuf.Descriptor();
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL = protobuf.Descriptor();
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDATA = protobuf.Descriptor();
_M.SCENEEVENTDATA_DETAILLIST_FIELD = protobuf.FieldDescriptor();

_M.C2SSCENEPROTOCOL_TEST_ENUM.name = "Test"
_M.C2SSCENEPROTOCOL_TEST_ENUM.index = 0
_M.C2SSCENEPROTOCOL_TEST_ENUM.number = 1
_M.C2SSCENEPROTOCOL.name = "C2SSceneProtocol"
_M.C2SSCENEPROTOCOL.full_name = ".SceneProtocol.C2SSceneProtocol"
_M.C2SSCENEPROTOCOL.values = {_M.C2SSCENEPROTOCOL_TEST_ENUM}
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.name = "CmdSyncSceneEventData"
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.index = 0
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.number = 1
_M.S2CSCENEPROTOCOL.name = "S2CSceneProtocol"
_M.S2CSCENEPROTOCOL.full_name = ".SceneProtocol.S2CSceneProtocol"
_M.S2CSCENEPROTOCOL.values = {_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM}
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.name = "EnterView"
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.index = 0
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.number = 1
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.name = "LeaveView"
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.index = 1
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.number = 2
_M.SCENEEVENTTYPE.name = "SceneEventType"
_M.SCENEEVENTTYPE.full_name = ".SceneProtocol.SceneEventType"
_M.SCENEEVENTTYPE.values = {_M.SCENEEVENTTYPE_ENTERVIEW_ENUM,_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM}
_M.ENTITYPOS_POSX_FIELD.name = "posX"
_M.ENTITYPOS_POSX_FIELD.full_name = ".SceneProtocol.EntityPos.posX"
_M.ENTITYPOS_POSX_FIELD.number = 1
_M.ENTITYPOS_POSX_FIELD.index = 0
_M.ENTITYPOS_POSX_FIELD.label = 2
_M.ENTITYPOS_POSX_FIELD.has_default_value = false
_M.ENTITYPOS_POSX_FIELD.default_value = 0
_M.ENTITYPOS_POSX_FIELD.type = 13
_M.ENTITYPOS_POSX_FIELD.cpp_type = 3

_M.ENTITYPOS_POSY_FIELD.name = "posY"
_M.ENTITYPOS_POSY_FIELD.full_name = ".SceneProtocol.EntityPos.posY"
_M.ENTITYPOS_POSY_FIELD.number = 2
_M.ENTITYPOS_POSY_FIELD.index = 1
_M.ENTITYPOS_POSY_FIELD.label = 2
_M.ENTITYPOS_POSY_FIELD.has_default_value = false
_M.ENTITYPOS_POSY_FIELD.default_value = 0
_M.ENTITYPOS_POSY_FIELD.type = 13
_M.ENTITYPOS_POSY_FIELD.cpp_type = 3

_M.ENTITYPOS_POSZ_FIELD.name = "posZ"
_M.ENTITYPOS_POSZ_FIELD.full_name = ".SceneProtocol.EntityPos.posZ"
_M.ENTITYPOS_POSZ_FIELD.number = 3
_M.ENTITYPOS_POSZ_FIELD.index = 2
_M.ENTITYPOS_POSZ_FIELD.label = 2
_M.ENTITYPOS_POSZ_FIELD.has_default_value = false
_M.ENTITYPOS_POSZ_FIELD.default_value = 0
_M.ENTITYPOS_POSZ_FIELD.type = 13
_M.ENTITYPOS_POSZ_FIELD.cpp_type = 3

_M.ENTITYPOS.name = "EntityPos"
_M.ENTITYPOS.full_name = ".SceneProtocol.EntityPos"
_M.ENTITYPOS.nested_types = {}
_M.ENTITYPOS.enum_types = {}
_M.ENTITYPOS.fields = {_M.ENTITYPOS_POSX_FIELD, _M.ENTITYPOS_POSY_FIELD, _M.ENTITYPOS_POSZ_FIELD}
_M.ENTITYPOS.is_extendable = false
_M.ENTITYPOS.extensions = {}
_M.STATEBEHAVIOR_STATE_FIELD.name = "state"
_M.STATEBEHAVIOR_STATE_FIELD.full_name = ".SceneProtocol.StateBehavior.state"
_M.STATEBEHAVIOR_STATE_FIELD.number = 1
_M.STATEBEHAVIOR_STATE_FIELD.index = 0
_M.STATEBEHAVIOR_STATE_FIELD.label = 2
_M.STATEBEHAVIOR_STATE_FIELD.has_default_value = false
_M.STATEBEHAVIOR_STATE_FIELD.default_value = 0
_M.STATEBEHAVIOR_STATE_FIELD.type = 13
_M.STATEBEHAVIOR_STATE_FIELD.cpp_type = 3

_M.STATEBEHAVIOR_TARGETPOS_FIELD.name = "targetPos"
_M.STATEBEHAVIOR_TARGETPOS_FIELD.full_name = ".SceneProtocol.StateBehavior.targetPos"
_M.STATEBEHAVIOR_TARGETPOS_FIELD.number = 2
_M.STATEBEHAVIOR_TARGETPOS_FIELD.index = 1
_M.STATEBEHAVIOR_TARGETPOS_FIELD.label = 1
_M.STATEBEHAVIOR_TARGETPOS_FIELD.has_default_value = false
_M.STATEBEHAVIOR_TARGETPOS_FIELD.default_value = nil
_M.STATEBEHAVIOR_TARGETPOS_FIELD.message_type = _M.ENTITYPOS
_M.STATEBEHAVIOR_TARGETPOS_FIELD.type = 11
_M.STATEBEHAVIOR_TARGETPOS_FIELD.cpp_type = 10

_M.STATEBEHAVIOR.name = "StateBehavior"
_M.STATEBEHAVIOR.full_name = ".SceneProtocol.StateBehavior"
_M.STATEBEHAVIOR.nested_types = {}
_M.STATEBEHAVIOR.enum_types = {}
_M.STATEBEHAVIOR.fields = {_M.STATEBEHAVIOR_STATE_FIELD, _M.STATEBEHAVIOR_TARGETPOS_FIELD}
_M.STATEBEHAVIOR.is_extendable = false
_M.STATEBEHAVIOR.extensions = {}
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.name = "entityType"
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.full_name = ".SceneProtocol.EntityBaseData.entityType"
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.number = 1
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.index = 0
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.label = 2
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.has_default_value = false
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.default_value = 0
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.type = 13
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD.cpp_type = 3

_M.ENTITYBASEDATA_ACTORID_FIELD.name = "actorId"
_M.ENTITYBASEDATA_ACTORID_FIELD.full_name = ".SceneProtocol.EntityBaseData.actorId"
_M.ENTITYBASEDATA_ACTORID_FIELD.number = 2
_M.ENTITYBASEDATA_ACTORID_FIELD.index = 1
_M.ENTITYBASEDATA_ACTORID_FIELD.label = 2
_M.ENTITYBASEDATA_ACTORID_FIELD.has_default_value = false
_M.ENTITYBASEDATA_ACTORID_FIELD.default_value = 0
_M.ENTITYBASEDATA_ACTORID_FIELD.type = 4
_M.ENTITYBASEDATA_ACTORID_FIELD.cpp_type = 4

_M.ENTITYBASEDATA_CURPOS_FIELD.name = "curPos"
_M.ENTITYBASEDATA_CURPOS_FIELD.full_name = ".SceneProtocol.EntityBaseData.curPos"
_M.ENTITYBASEDATA_CURPOS_FIELD.number = 3
_M.ENTITYBASEDATA_CURPOS_FIELD.index = 2
_M.ENTITYBASEDATA_CURPOS_FIELD.label = 2
_M.ENTITYBASEDATA_CURPOS_FIELD.has_default_value = false
_M.ENTITYBASEDATA_CURPOS_FIELD.default_value = nil
_M.ENTITYBASEDATA_CURPOS_FIELD.message_type = _M.ENTITYPOS
_M.ENTITYBASEDATA_CURPOS_FIELD.type = 11
_M.ENTITYBASEDATA_CURPOS_FIELD.cpp_type = 10

_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.name = "stateBehavior"
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.full_name = ".SceneProtocol.EntityBaseData.stateBehavior"
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.number = 4
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.index = 3
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.label = 2
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.has_default_value = false
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.default_value = nil
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.message_type = _M.STATEBEHAVIOR
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.type = 11
_M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD.cpp_type = 10

_M.ENTITYBASEDATA.name = "EntityBaseData"
_M.ENTITYBASEDATA.full_name = ".SceneProtocol.EntityBaseData"
_M.ENTITYBASEDATA.nested_types = {}
_M.ENTITYBASEDATA.enum_types = {}
_M.ENTITYBASEDATA.fields = {_M.ENTITYBASEDATA_ENTITYTYPE_FIELD, _M.ENTITYBASEDATA_ACTORID_FIELD, _M.ENTITYBASEDATA_CURPOS_FIELD, _M.ENTITYBASEDATA_STATEBEHAVIOR_FIELD}
_M.ENTITYBASEDATA.is_extendable = false
_M.ENTITYBASEDATA.extensions = {}
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.name = "entityBaseData"
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.full_name = ".SceneProtocol.SceneEntityInfo.entityBaseData"
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.number = 1
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.index = 0
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.label = 2
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.has_default_value = false
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.default_value = nil
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.message_type = _M.ENTITYBASEDATA
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.type = 11
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD.cpp_type = 10

_M.SCENEENTITYINFO.name = "SceneEntityInfo"
_M.SCENEENTITYINFO.full_name = ".SceneProtocol.SceneEntityInfo"
_M.SCENEENTITYINFO.nested_types = {}
_M.SCENEENTITYINFO.enum_types = {}
_M.SCENEENTITYINFO.fields = {_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD}
_M.SCENEENTITYINFO.is_extendable = false
_M.SCENEENTITYINFO.extensions = {}
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.name = "eventType"
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.full_name = ".SceneProtocol.SceneEventDetail.eventType"
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.number = 1
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.index = 0
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.label = 2
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.has_default_value = false
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.default_value = nil
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.enum_type = _M.SCENEEVENTTYPE
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.type = 14
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD.cpp_type = 8

_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.name = "enterView"
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.full_name = ".SceneProtocol.SceneEventDetail.enterView"
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.number = 2
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.index = 1
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.label = 1
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.has_default_value = false
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.default_value = nil
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.message_type = _M.SCENEENTITYINFO
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.type = 11
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD.cpp_type = 10

_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.name = "leaveView"
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.full_name = ".SceneProtocol.SceneEventDetail.leaveView"
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.number = 3
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.index = 2
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.label = 1
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.has_default_value = false
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.default_value = 0
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.type = 4
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD.cpp_type = 4

_M.SCENEEVENTDETAIL.name = "SceneEventDetail"
_M.SCENEEVENTDETAIL.full_name = ".SceneProtocol.SceneEventDetail"
_M.SCENEEVENTDETAIL.nested_types = {}
_M.SCENEEVENTDETAIL.enum_types = {}
_M.SCENEEVENTDETAIL.fields = {_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD, _M.SCENEEVENTDETAIL_ENTERVIEW_FIELD, _M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD}
_M.SCENEEVENTDETAIL.is_extendable = false
_M.SCENEEVENTDETAIL.extensions = {}
_M.SCENEEVENTDATA_DETAILLIST_FIELD.name = "detailList"
_M.SCENEEVENTDATA_DETAILLIST_FIELD.full_name = ".SceneProtocol.SceneEventData.detailList"
_M.SCENEEVENTDATA_DETAILLIST_FIELD.number = 1
_M.SCENEEVENTDATA_DETAILLIST_FIELD.index = 0
_M.SCENEEVENTDATA_DETAILLIST_FIELD.label = 3
_M.SCENEEVENTDATA_DETAILLIST_FIELD.has_default_value = false
_M.SCENEEVENTDATA_DETAILLIST_FIELD.default_value = {}
_M.SCENEEVENTDATA_DETAILLIST_FIELD.message_type = _M.SCENEEVENTDETAIL
_M.SCENEEVENTDATA_DETAILLIST_FIELD.type = 11
_M.SCENEEVENTDATA_DETAILLIST_FIELD.cpp_type = 10

_M.SCENEEVENTDATA.name = "SceneEventData"
_M.SCENEEVENTDATA.full_name = ".SceneProtocol.SceneEventData"
_M.SCENEEVENTDATA.nested_types = {}
_M.SCENEEVENTDATA.enum_types = {}
_M.SCENEEVENTDATA.fields = {_M.SCENEEVENTDATA_DETAILLIST_FIELD}
_M.SCENEEVENTDATA.is_extendable = false
_M.SCENEEVENTDATA.extensions = {}

_M.CmdSyncSceneEventData = 1
_M.EnterView = 1
_M.EntityBaseData = protobuf.Message(_M.ENTITYBASEDATA)
_M.EntityPos = protobuf.Message(_M.ENTITYPOS)
_M.LeaveView = 2
_M.SceneEntityInfo = protobuf.Message(_M.SCENEENTITYINFO)
_M.SceneEventData = protobuf.Message(_M.SCENEEVENTDATA)
_M.SceneEventDetail = protobuf.Message(_M.SCENEEVENTDETAIL)
_M.StateBehavior = protobuf.Message(_M.STATEBEHAVIOR)
_M.Test = 1

return _M