﻿using System.Collections.Generic;
using System;
using UnityEngine;
using XLua;
using System.Reflection;

public static class GenConfig
{
    //lua中要使用到C#库的配置，比如C#标准库，或者Unity API，第三方库等。
    [LuaCallCSharp]
    public static List<Type> LuaCallCSharp = new List<Type>() {
		// unity
		typeof(System.Object),
        typeof(UnityEngine.Object),
        typeof(Ray2D),
        typeof(GameObject),
        typeof(Component),
        typeof(Behaviour),
        typeof(Transform),
        typeof(Resources),
        typeof(TextAsset),
        typeof(Keyframe),
        typeof(AnimationCurve),
        typeof(AnimationClip),
        typeof(MonoBehaviour),
        typeof(ParticleSystem),
        typeof(SkinnedMeshRenderer),
        typeof(Renderer),
        typeof(WWW),
        typeof(List<int>),
        typeof(Action<string>),
        typeof(UnityEngine.Debug),
        typeof(Delegate),
        typeof(Dictionary<string, GameObject>),
        typeof(UnityEngine.Events.UnityEvent),

        // unity结合lua，这部分导出很多功能在lua侧重新实现，没有实现的功能才会跑到cs侧
        typeof(Bounds),
        typeof(Color),
        typeof(LayerMask),
        typeof(Mathf),
        typeof(Plane),
        typeof(Quaternion),
        typeof(Ray),
        typeof(RaycastHit),
        typeof(Time),
        typeof(Touch),
        typeof(TouchPhase),
        typeof(Vector2),
        typeof(Vector3),
        typeof(Vector4),
        
        // 渲染
        typeof(RenderMode),
        
        // UGUI  
        typeof(UnityEngine.Canvas),
        typeof(UnityEngine.Rect),
        typeof(UnityEngine.RectTransform),
        typeof(UnityEngine.RectOffset),
        typeof(UnityEngine.Sprite),
        typeof(UnityEngine.UI.CanvasScaler),
        typeof(UnityEngine.UI.CanvasScaler.ScaleMode),
        typeof(UnityEngine.UI.CanvasScaler.ScreenMatchMode),
        typeof(UnityEngine.UI.GraphicRaycaster),
        typeof(UnityEngine.UI.Text),
        typeof(UnityEngine.UI.InputField),
        typeof(UnityEngine.UI.Button),
        typeof(UnityEngine.UI.Image),
        typeof(UnityEngine.UI.ScrollRect),
        typeof(UnityEngine.UI.Scrollbar),
        typeof(UnityEngine.UI.Toggle),
        typeof(UnityEngine.UI.ToggleGroup),
        typeof(UnityEngine.UI.Button.ButtonClickedEvent),
        typeof(UnityEngine.UI.ScrollRect.ScrollRectEvent),
        typeof(UnityEngine.UI.GridLayoutGroup),
        typeof(UnityEngine.UI.ContentSizeFitter),
        typeof(UnityEngine.UI.Slider),

        // easy touch
        // TODO：后续需要什么脚本再添加进来
        typeof(ETCArea),
        typeof(ETCAxis),
        typeof(ETCButton),
        typeof(ETCInput),
        typeof(ETCJoystick),

        // 场景、资源加载
        typeof(UnityEngine.Resources),
        typeof(UnityEngine.ResourceRequest),
        typeof(UnityEngine.SceneManagement.SceneManager),
        
        // 其它
        typeof(PlayerPrefs),
        typeof(System.GC),
        typeof(AsyncOperation),

        //ECS
        typeof(Unity.Entities.World),
        typeof(Unity.Entities.Entity),
        typeof(Unity.Entities.EntityManager),
        typeof(Unity.Entities.EntityArchetype),
        typeof(Unity.Entities.SystemBase),
        typeof(Unity.Entities.SystemState),
        typeof(Unity.Entities.ComponentSystem),
        typeof(Unity.Entities.ComponentSystemBase),
        typeof(Unity.Entities.ComponentSystemGroup),
    };

    //C#静态调用Lua的配置（包括事件的原型），仅可以配delegate，interface
    [CSharpCallLua]
    public static List<Type> CSharpCallLua = new List<Type>() {
		// unity
		typeof(Action),
        typeof(Action<int>),
        typeof(Action<WWW>),
        typeof(Callback),
        typeof(UnityEngine.Event),
        typeof(UnityEngine.Events.UnityAction),
        typeof(System.Collections.IEnumerator),
        typeof(UnityEngine.Events.UnityAction<Vector2>),
    };
    // 避免在IL2CPP下被裁剪
    [ReflectionUse]
    public static List<Type> ReflectionUse = new List<Type>(){
        typeof(AsyncOperation),
    };
	//黑名单
	[BlackList]
	public static List<List<string>> BlackList = new List<List<string>>()  {
        new List<string>(){"System.Xml.XmlNodeList", "ItemOf"},
        new List<string>(){"UnityEngine.WWW", "movie"},
#if UNITY_WEBGL
        new List<string>(){"UnityEngine.WWW", "threadPriority"},
#endif
        new List<string>(){"UnityEngine.Texture2D", "alphaIsTransparency"},
        new List<string>(){"UnityEngine.Security", "GetChainOfTrustValue"},
        new List<string>(){"UnityEngine.CanvasRenderer", "onRequestRebuild"},
        new List<string>(){"UnityEngine.Light", "areaSize"},
        new List<string>(){"UnityEngine.Light", "lightmapBakeType"},
#if UNITY_ANDROID
        new List<string>(){"UnityEngine.Light", "SetLightDirty"},
        new List<string>(){"UnityEngine.Light", "shadowRadius"},
        new List<string>(){"UnityEngine.Light", "shadowAngle"},
#endif
        new List<string>(){"UnityEngine.WWW", "MovieTexture"},
        new List<string>(){"UnityEngine.WWW", "GetMovieTexture"},
        new List<string>(){"UnityEngine.AnimatorOverrideController", "PerformOverrideClipListCleanup"},
#if !UNITY_WEBPLAYER
        new List<string>(){"UnityEngine.Application", "ExternalEval"},
#endif
        new List<string>(){"UnityEngine.GameObject", "networkView"}, //4.6.2 not support
        new List<string>(){"UnityEngine.Component", "networkView"},  //4.6.2 not support
        new List<string>(){"System.IO.FileInfo", "GetAccessControl", "System.Security.AccessControl.AccessControlSections"},
        new List<string>(){"System.IO.FileInfo", "SetAccessControl", "System.Security.AccessControl.FileSecurity"},
        new List<string>(){"System.IO.DirectoryInfo", "GetAccessControl", "System.Security.AccessControl.AccessControlSections"},
        new List<string>(){"System.IO.DirectoryInfo", "SetAccessControl", "System.Security.AccessControl.DirectorySecurity"},
        new List<string>(){"System.IO.DirectoryInfo", "CreateSubdirectory", "System.String", "System.Security.AccessControl.DirectorySecurity"},
        new List<string>(){"System.IO.DirectoryInfo", "Create", "System.Security.AccessControl.DirectorySecurity"},
        new List<string>(){"UnityEngine.MonoBehaviour", "runInEditMode"},

		new List<string>(){"UnityEngine.UI.Text", "OnRebuildRequested"},
        new List<string>(){"System.Type", "IsSZArray"},
    };


#if UNITY_2018_1_OR_NEWER
    [BlackList]
    public static Func<MemberInfo, bool> MethodFilter = (memberInfo) =>
    {
        if (memberInfo.DeclaringType.IsGenericType && memberInfo.DeclaringType.GetGenericTypeDefinition() == typeof(Dictionary<,>))
        {
            if (memberInfo.MemberType == MemberTypes.Constructor)
            {
                ConstructorInfo constructorInfo = memberInfo as ConstructorInfo;
                var parameterInfos = constructorInfo.GetParameters();
                if (parameterInfos.Length > 0)
                {
                    if (typeof(System.Collections.IEnumerable).IsAssignableFrom(parameterInfos[0].ParameterType))
                    {
                        return true;
                    }
                }
            }
            else if (memberInfo.MemberType == MemberTypes.Method)
            {
                var methodInfo = memberInfo as MethodInfo;
                if (methodInfo.Name == "TryAdd" || methodInfo.Name == "Remove" && methodInfo.GetParameters().Length == 2)
                {
                    return true;
                }
            }
        }
        return false;
    };
#endif
}
