--Generated By protoc-gen-lua Do not Edit
local protobuf = require "Framework.Net.Protobuf.protobuf"
local _M = {}

_M.ACTORTYPE = protobuf.EnumDescriptor();
_M.ACTORTYPE_NONE_ENUM = protobuf.EnumValueDescriptor();
_M.ACTORTYPE_AVATAR_ENUM = protobuf.EnumValueDescriptor();
_M.ACTORTYPE_MAX_ENUM = protobuf.EnumValueDescriptor();
_M.C2SSCENEPROTOCOL = protobuf.EnumDescriptor();
_M.C2SSCENEPROTOCOL_REQMOVE_ENUM = protobuf.EnumValueDescriptor();
_M.C2SSCENEPROTOCOL_SYNCPOS_ENUM = protobuf.EnumValueDescriptor();
_M.S2CSCENEPROTOCOL = protobuf.EnumDescriptor();
_M.S2CSCENEPROTOCOL_CMDSYNCENTERSCENE_ENUM = protobuf.EnumValueDescriptor();
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM = protobuf.EnumValueDescriptor();
_M.SCENEEVENTTYPE = protobuf.EnumDescriptor();
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM = protobuf.EnumValueDescriptor();
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM = protobuf.EnumValueDescriptor();
_M.SCENEEVENTTYPE_SYNCMOVE_ENUM = protobuf.EnumValueDescriptor();
_M.VECTOR3 = protobuf.Descriptor();
_M.VECTOR3_X_FIELD = protobuf.FieldDescriptor();
_M.VECTOR3_Y_FIELD = protobuf.FieldDescriptor();
_M.VECTOR3_Z_FIELD = protobuf.FieldDescriptor();
_M.MOVEBEHAVIOR = protobuf.Descriptor();
_M.MOVEBEHAVIOR_STATE_FIELD = protobuf.FieldDescriptor();
_M.MOVEBEHAVIOR_FORWARD_FIELD = protobuf.FieldDescriptor();
_M.MOVEBEHAVIOR_MOVEVEC_FIELD = protobuf.FieldDescriptor();
_M.MOVEDATA = protobuf.Descriptor();
_M.MOVEDATA_ACTORID_FIELD = protobuf.FieldDescriptor();
_M.MOVEDATA_CURPOS_FIELD = protobuf.FieldDescriptor();
_M.MOVEDATA_BEHAVIOR_FIELD = protobuf.FieldDescriptor();
_M.SYNCPOSDATA = protobuf.Descriptor();
_M.SYNCPOSDATA_ACTORID_FIELD = protobuf.FieldDescriptor();
_M.SYNCPOSDATA_CURPOS_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA = protobuf.Descriptor();
_M.ENTITYBASEDATA_ENTITYTYPE_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_ACTORID_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_CURPOS_FIELD = protobuf.FieldDescriptor();
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD = protobuf.FieldDescriptor();
_M.SCENEENTITYINFO = protobuf.Descriptor();
_M.SCENEENTITYINFO_ENTITYBASEDATA_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL = protobuf.Descriptor();
_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL_ENTERVIEW_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDETAIL_MOVE_FIELD = protobuf.FieldDescriptor();
_M.SCENEEVENTDATA = protobuf.Descriptor();
_M.SCENEEVENTDATA_DETAILLIST_FIELD = protobuf.FieldDescriptor();

_M.ACTORTYPE_NONE_ENUM.name = "None"
_M.ACTORTYPE_NONE_ENUM.index = 0
_M.ACTORTYPE_NONE_ENUM.number = 0
_M.ACTORTYPE_AVATAR_ENUM.name = "Avatar"
_M.ACTORTYPE_AVATAR_ENUM.index = 1
_M.ACTORTYPE_AVATAR_ENUM.number = 1
_M.ACTORTYPE_MAX_ENUM.name = "Max"
_M.ACTORTYPE_MAX_ENUM.index = 2
_M.ACTORTYPE_MAX_ENUM.number = 2
_M.ACTORTYPE.name = "ActorType"
_M.ACTORTYPE.full_name = ".SceneProtocol.ActorType"
_M.ACTORTYPE.values = {_M.ACTORTYPE_NONE_ENUM,_M.ACTORTYPE_AVATAR_ENUM,_M.ACTORTYPE_MAX_ENUM}
_M.C2SSCENEPROTOCOL_REQMOVE_ENUM.name = "ReqMove"
_M.C2SSCENEPROTOCOL_REQMOVE_ENUM.index = 0
_M.C2SSCENEPROTOCOL_REQMOVE_ENUM.number = 1
_M.C2SSCENEPROTOCOL_SYNCPOS_ENUM.name = "SyncPos"
_M.C2SSCENEPROTOCOL_SYNCPOS_ENUM.index = 1
_M.C2SSCENEPROTOCOL_SYNCPOS_ENUM.number = 2
_M.C2SSCENEPROTOCOL.name = "C2SSceneProtocol"
_M.C2SSCENEPROTOCOL.full_name = ".SceneProtocol.C2SSceneProtocol"
_M.C2SSCENEPROTOCOL.values = {_M.C2SSCENEPROTOCOL_REQMOVE_ENUM,_M.C2SSCENEPROTOCOL_SYNCPOS_ENUM}
_M.S2CSCENEPROTOCOL_CMDSYNCENTERSCENE_ENUM.name = "CmdSyncEnterScene"
_M.S2CSCENEPROTOCOL_CMDSYNCENTERSCENE_ENUM.index = 0
_M.S2CSCENEPROTOCOL_CMDSYNCENTERSCENE_ENUM.number = 1
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.name = "CmdSyncSceneEventData"
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.index = 1
_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM.number = 2
_M.S2CSCENEPROTOCOL.name = "S2CSceneProtocol"
_M.S2CSCENEPROTOCOL.full_name = ".SceneProtocol.S2CSceneProtocol"
_M.S2CSCENEPROTOCOL.values = {_M.S2CSCENEPROTOCOL_CMDSYNCENTERSCENE_ENUM,_M.S2CSCENEPROTOCOL_CMDSYNCSCENEEVENTDATA_ENUM}
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.name = "EnterView"
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.index = 0
_M.SCENEEVENTTYPE_ENTERVIEW_ENUM.number = 1
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.name = "LeaveView"
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.index = 1
_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM.number = 2
_M.SCENEEVENTTYPE_SYNCMOVE_ENUM.name = "SyncMove"
_M.SCENEEVENTTYPE_SYNCMOVE_ENUM.index = 2
_M.SCENEEVENTTYPE_SYNCMOVE_ENUM.number = 3
_M.SCENEEVENTTYPE.name = "SceneEventType"
_M.SCENEEVENTTYPE.full_name = ".SceneProtocol.SceneEventType"
_M.SCENEEVENTTYPE.values = {_M.SCENEEVENTTYPE_ENTERVIEW_ENUM,_M.SCENEEVENTTYPE_LEAVEVIEW_ENUM,_M.SCENEEVENTTYPE_SYNCMOVE_ENUM}
_M.VECTOR3_X_FIELD.name = "x"
_M.VECTOR3_X_FIELD.full_name = ".SceneProtocol.Vector3.x"
_M.VECTOR3_X_FIELD.number = 1
_M.VECTOR3_X_FIELD.index = 0
_M.VECTOR3_X_FIELD.label = 2
_M.VECTOR3_X_FIELD.has_default_value = false
_M.VECTOR3_X_FIELD.default_value = 0
_M.VECTOR3_X_FIELD.type = 5
_M.VECTOR3_X_FIELD.cpp_type = 1

_M.VECTOR3_Y_FIELD.name = "y"
_M.VECTOR3_Y_FIELD.full_name = ".SceneProtocol.Vector3.y"
_M.VECTOR3_Y_FIELD.number = 2
_M.VECTOR3_Y_FIELD.index = 1
_M.VECTOR3_Y_FIELD.label = 2
_M.VECTOR3_Y_FIELD.has_default_value = false
_M.VECTOR3_Y_FIELD.default_value = 0
_M.VECTOR3_Y_FIELD.type = 5
_M.VECTOR3_Y_FIELD.cpp_type = 1

_M.VECTOR3_Z_FIELD.name = "z"
_M.VECTOR3_Z_FIELD.full_name = ".SceneProtocol.Vector3.z"
_M.VECTOR3_Z_FIELD.number = 3
_M.VECTOR3_Z_FIELD.index = 2
_M.VECTOR3_Z_FIELD.label = 2
_M.VECTOR3_Z_FIELD.has_default_value = false
_M.VECTOR3_Z_FIELD.default_value = 0
_M.VECTOR3_Z_FIELD.type = 5
_M.VECTOR3_Z_FIELD.cpp_type = 1

_M.VECTOR3.name = "Vector3"
_M.VECTOR3.full_name = ".SceneProtocol.Vector3"
_M.VECTOR3.nested_types = {}
_M.VECTOR3.enum_types = {}
_M.VECTOR3.fields = {_M.VECTOR3_X_FIELD, _M.VECTOR3_Y_FIELD, _M.VECTOR3_Z_FIELD}
_M.VECTOR3.is_extendable = false
_M.VECTOR3.extensions = {}
_M.MOVEBEHAVIOR_STATE_FIELD.name = "state"
_M.MOVEBEHAVIOR_STATE_FIELD.full_name = ".SceneProtocol.MoveBehavior.state"
_M.MOVEBEHAVIOR_STATE_FIELD.number = 1
_M.MOVEBEHAVIOR_STATE_FIELD.index = 0
_M.MOVEBEHAVIOR_STATE_FIELD.label = 2
_M.MOVEBEHAVIOR_STATE_FIELD.has_default_value = false
_M.MOVEBEHAVIOR_STATE_FIELD.default_value = 0
_M.MOVEBEHAVIOR_STATE_FIELD.type = 13
_M.MOVEBEHAVIOR_STATE_FIELD.cpp_type = 3

_M.MOVEBEHAVIOR_FORWARD_FIELD.name = "forward"
_M.MOVEBEHAVIOR_FORWARD_FIELD.full_name = ".SceneProtocol.MoveBehavior.forward"
_M.MOVEBEHAVIOR_FORWARD_FIELD.number = 2
_M.MOVEBEHAVIOR_FORWARD_FIELD.index = 1
_M.MOVEBEHAVIOR_FORWARD_FIELD.label = 2
_M.MOVEBEHAVIOR_FORWARD_FIELD.has_default_value = false
_M.MOVEBEHAVIOR_FORWARD_FIELD.default_value = nil
_M.MOVEBEHAVIOR_FORWARD_FIELD.message_type = _M.VECTOR3
_M.MOVEBEHAVIOR_FORWARD_FIELD.type = 11
_M.MOVEBEHAVIOR_FORWARD_FIELD.cpp_type = 10

_M.MOVEBEHAVIOR_MOVEVEC_FIELD.name = "moveVec"
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.full_name = ".SceneProtocol.MoveBehavior.moveVec"
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.number = 3
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.index = 2
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.label = 1
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.has_default_value = false
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.default_value = nil
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.message_type = _M.VECTOR3
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.type = 11
_M.MOVEBEHAVIOR_MOVEVEC_FIELD.cpp_type = 10

_M.MOVEBEHAVIOR.name = "MoveBehavior"
_M.MOVEBEHAVIOR.full_name = ".SceneProtocol.MoveBehavior"
_M.MOVEBEHAVIOR.nested_types = {}
_M.MOVEBEHAVIOR.enum_types = {}
_M.MOVEBEHAVIOR.fields = {_M.MOVEBEHAVIOR_STATE_FIELD, _M.MOVEBEHAVIOR_FORWARD_FIELD, _M.MOVEBEHAVIOR_MOVEVEC_FIELD}
_M.MOVEBEHAVIOR.is_extendable = false
_M.MOVEBEHAVIOR.extensions = {}
_M.MOVEDATA_ACTORID_FIELD.name = "actorId"
_M.MOVEDATA_ACTORID_FIELD.full_name = ".SceneProtocol.MoveData.actorId"
_M.MOVEDATA_ACTORID_FIELD.number = 1
_M.MOVEDATA_ACTORID_FIELD.index = 0
_M.MOVEDATA_ACTORID_FIELD.label = 2
_M.MOVEDATA_ACTORID_FIELD.has_default_value = false
_M.MOVEDATA_ACTORID_FIELD.default_value = 0
_M.MOVEDATA_ACTORID_FIELD.type = 4
_M.MOVEDATA_ACTORID_FIELD.cpp_type = 4

_M.MOVEDATA_CURPOS_FIELD.name = "curPos"
_M.MOVEDATA_CURPOS_FIELD.full_name = ".SceneProtocol.MoveData.curPos"
_M.MOVEDATA_CURPOS_FIELD.number = 2
_M.MOVEDATA_CURPOS_FIELD.index = 1
_M.MOVEDATA_CURPOS_FIELD.label = 2
_M.MOVEDATA_CURPOS_FIELD.has_default_value = false
_M.MOVEDATA_CURPOS_FIELD.default_value = nil
_M.MOVEDATA_CURPOS_FIELD.message_type = _M.VECTOR3
_M.MOVEDATA_CURPOS_FIELD.type = 11
_M.MOVEDATA_CURPOS_FIELD.cpp_type = 10

_M.MOVEDATA_BEHAVIOR_FIELD.name = "behavior"
_M.MOVEDATA_BEHAVIOR_FIELD.full_name = ".SceneProtocol.MoveData.behavior"
_M.MOVEDATA_BEHAVIOR_FIELD.number = 3
_M.MOVEDATA_BEHAVIOR_FIELD.index = 2
_M.MOVEDATA_BEHAVIOR_FIELD.label = 2
_M.MOVEDATA_BEHAVIOR_FIELD.has_default_value = false
_M.MOVEDATA_BEHAVIOR_FIELD.default_value = nil
_M.MOVEDATA_BEHAVIOR_FIELD.message_type = _M.MOVEBEHAVIOR
_M.MOVEDATA_BEHAVIOR_FIELD.type = 11
_M.MOVEDATA_BEHAVIOR_FIELD.cpp_type = 10

_M.MOVEDATA.name = "MoveData"
_M.MOVEDATA.full_name = ".SceneProtocol.MoveData"
_M.MOVEDATA.nested_types = {}
_M.MOVEDATA.enum_types = {}
_M.MOVEDATA.fields = {_M.MOVEDATA_ACTORID_FIELD, _M.MOVEDATA_CURPOS_FIELD, _M.MOVEDATA_BEHAVIOR_FIELD}
_M.MOVEDATA.is_extendable = false
_M.MOVEDATA.extensions = {}
_M.SYNCPOSDATA_ACTORID_FIELD.name = "actorId"
_M.SYNCPOSDATA_ACTORID_FIELD.full_name = ".SceneProtocol.SyncPosData.actorId"
_M.SYNCPOSDATA_ACTORID_FIELD.number = 1
_M.SYNCPOSDATA_ACTORID_FIELD.index = 0
_M.SYNCPOSDATA_ACTORID_FIELD.label = 2
_M.SYNCPOSDATA_ACTORID_FIELD.has_default_value = false
_M.SYNCPOSDATA_ACTORID_FIELD.default_value = 0
_M.SYNCPOSDATA_ACTORID_FIELD.type = 4
_M.SYNCPOSDATA_ACTORID_FIELD.cpp_type = 4

_M.SYNCPOSDATA_CURPOS_FIELD.name = "curPos"
_M.SYNCPOSDATA_CURPOS_FIELD.full_name = ".SceneProtocol.SyncPosData.curPos"
_M.SYNCPOSDATA_CURPOS_FIELD.number = 2
_M.SYNCPOSDATA_CURPOS_FIELD.index = 1
_M.SYNCPOSDATA_CURPOS_FIELD.label = 2
_M.SYNCPOSDATA_CURPOS_FIELD.has_default_value = false
_M.SYNCPOSDATA_CURPOS_FIELD.default_value = nil
_M.SYNCPOSDATA_CURPOS_FIELD.message_type = _M.VECTOR3
_M.SYNCPOSDATA_CURPOS_FIELD.type = 11
_M.SYNCPOSDATA_CURPOS_FIELD.cpp_type = 10

_M.SYNCPOSDATA.name = "SyncPosData"
_M.SYNCPOSDATA.full_name = ".SceneProtocol.SyncPosData"
_M.SYNCPOSDATA.nested_types = {}
_M.SYNCPOSDATA.enum_types = {}
_M.SYNCPOSDATA.fields = {_M.SYNCPOSDATA_ACTORID_FIELD, _M.SYNCPOSDATA_CURPOS_FIELD}
_M.SYNCPOSDATA.is_extendable = false
_M.SYNCPOSDATA.extensions = {}
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
_M.ENTITYBASEDATA_CURPOS_FIELD.message_type = _M.VECTOR3
_M.ENTITYBASEDATA_CURPOS_FIELD.type = 11
_M.ENTITYBASEDATA_CURPOS_FIELD.cpp_type = 10

_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.name = "moveBehavior"
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.full_name = ".SceneProtocol.EntityBaseData.moveBehavior"
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.number = 4
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.index = 3
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.label = 1
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.has_default_value = false
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.default_value = nil
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.message_type = _M.MOVEBEHAVIOR
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.type = 11
_M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD.cpp_type = 10

_M.ENTITYBASEDATA.name = "EntityBaseData"
_M.ENTITYBASEDATA.full_name = ".SceneProtocol.EntityBaseData"
_M.ENTITYBASEDATA.nested_types = {}
_M.ENTITYBASEDATA.enum_types = {}
_M.ENTITYBASEDATA.fields = {_M.ENTITYBASEDATA_ENTITYTYPE_FIELD, _M.ENTITYBASEDATA_ACTORID_FIELD, _M.ENTITYBASEDATA_CURPOS_FIELD, _M.ENTITYBASEDATA_MOVEBEHAVIOR_FIELD}
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

_M.SCENEEVENTDETAIL_MOVE_FIELD.name = "move"
_M.SCENEEVENTDETAIL_MOVE_FIELD.full_name = ".SceneProtocol.SceneEventDetail.move"
_M.SCENEEVENTDETAIL_MOVE_FIELD.number = 4
_M.SCENEEVENTDETAIL_MOVE_FIELD.index = 3
_M.SCENEEVENTDETAIL_MOVE_FIELD.label = 1
_M.SCENEEVENTDETAIL_MOVE_FIELD.has_default_value = false
_M.SCENEEVENTDETAIL_MOVE_FIELD.default_value = nil
_M.SCENEEVENTDETAIL_MOVE_FIELD.message_type = _M.MOVEDATA
_M.SCENEEVENTDETAIL_MOVE_FIELD.type = 11
_M.SCENEEVENTDETAIL_MOVE_FIELD.cpp_type = 10

_M.SCENEEVENTDETAIL.name = "SceneEventDetail"
_M.SCENEEVENTDETAIL.full_name = ".SceneProtocol.SceneEventDetail"
_M.SCENEEVENTDETAIL.nested_types = {}
_M.SCENEEVENTDETAIL.enum_types = {}
_M.SCENEEVENTDETAIL.fields = {_M.SCENEEVENTDETAIL_EVENTTYPE_FIELD, _M.SCENEEVENTDETAIL_ENTERVIEW_FIELD, _M.SCENEEVENTDETAIL_LEAVEVIEW_FIELD, _M.SCENEEVENTDETAIL_MOVE_FIELD}
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

_M.Avatar = 1
_M.CmdSyncEnterScene = 1
_M.CmdSyncSceneEventData = 2
_M.EnterView = 1
_M.EntityBaseData = protobuf.Message(_M.ENTITYBASEDATA)
_M.LeaveView = 2
_M.Max = 2
_M.MoveBehavior = protobuf.Message(_M.MOVEBEHAVIOR)
_M.MoveData = protobuf.Message(_M.MOVEDATA)
_M.None = 0
_M.ReqMove = 1
_M.SceneEntityInfo = protobuf.Message(_M.SCENEENTITYINFO)
_M.SceneEventData = protobuf.Message(_M.SCENEEVENTDATA)
_M.SceneEventDetail = protobuf.Message(_M.SCENEEVENTDETAIL)
_M.SyncMove = 3
_M.SyncPos = 2
_M.SyncPosData = protobuf.Message(_M.SYNCPOSDATA)
_M.Vector3 = protobuf.Message(_M.VECTOR3)

return _M