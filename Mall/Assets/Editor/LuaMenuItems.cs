/*

    Copyright (c) 2024 Pocketz World. All rights reserved.

    This is a generated file, do not edit!

    Generated by com.pz.studio
*/

using System;
using System.Linq;
using UnityEngine;
using UnityEditor;

namespace Highrise.Studio.Generated
{
    internal static class LuaMenuItems
    {
        private static Type s_luaScriptType;
        private static Type s_luaBehaviourType;

        private static void LoadScriptType()
        {
            var assembly = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetName().Name == "com.pz.highrise.lua");
            if (assembly == null)
                return;

            s_luaScriptType = assembly.GetTypes().FirstOrDefault(t => t.Name == "LuaScript");
            if (s_luaScriptType == null)
                return;

            assembly = AppDomain.CurrentDomain.GetAssemblies().FirstOrDefault(a => a.GetName().Name == "com.pz.highrise.game.client");
            if (assembly == null)
                return;

            s_luaBehaviourType = assembly.GetTypes().FirstOrDefault(t => t.Name == "LuaBehaviour");
            if (s_luaBehaviourType == null)
                return;
        }

        private static void AddScript(string path)
        {
            var gameObjects = Selection.gameObjects;
            if (gameObjects.Length == 0)
                return;

            if (s_luaScriptType == null)
                LoadScriptType();

            if (s_luaScriptType == null || s_luaBehaviourType == null)
                return;

            var asset = AssetDatabase.LoadAssetAtPath(path, s_luaScriptType);
            if (asset == null)
                return;

            AddScript(gameObjects, asset);
        }

        private static void AddScript(GameObject[] parents, UnityEngine.Object script)
        {
            Undo.SetCurrentGroupName("Add Lua");

            foreach(var parent in parents)
            {
                var so = new SerializedObject(Undo.AddComponent(parent, s_luaBehaviourType));
                so.FindProperty("_script").objectReferenceValue = script;
                so.ApplyModifiedProperties();
            }

            Undo.RecordObjects(parents, "Add Lua");
        }

        [MenuItem("Component/Lua/Look Rotation")]
        private static void AddComponent1() => AddScript("Assets/Bird/LookRotation.lua");
        [MenuItem("Component/Lua/Pigeon Script")]
        private static void AddComponent2() => AddScript("Assets/Bird/Pigeons/PigeonScript.lua");
        [MenuItem("Component/Lua/Pigeon Spawner")]
        private static void AddComponent3() => AddScript("Assets/Bird/Pigeons/PigeonSpawner.lua");
        [MenuItem("Component/Lua/Camera Trigger Script")]
        private static void AddComponent4() => AddScript("Assets/CameraTriggerScript.lua");
        [MenuItem("Component/Lua/Color Peg")]
        private static void AddComponent5() => AddScript("Assets/ColorBoard/ColorPeg.lua");
        [MenuItem("Component/Lua/Color Picker")]
        private static void AddComponent6() => AddScript("Assets/ColorBoard/ColorPicker.lua");
        [MenuItem("Component/Lua/Light Board Spawner")]
        private static void AddComponent7() => AddScript("Assets/ColorBoard/LightBoardSpawner.lua");
        [MenuItem("Component/Lua/Light Board Eraser")]
        private static void AddComponent8() => AddScript("Assets/ColorBoard/Prefabs/EraseButton/LightBoardEraser.lua");
        [MenuItem("Component/Lua/Dice Controller")]
        private static void AddComponent9() => AddScript("Assets/Dice/DiceController.lua");
        [MenuItem("Component/Lua/Escalator Blocker")]
        private static void AddComponent10() => AddScript("Assets/EscalatorBlocker.lua");
        [MenuItem("Component/Lua/Escalator Script")]
        private static void AddComponent11() => AddScript("Assets/EscalatorScript.lua");
        [MenuItem("Component/Lua/Fire Works Script")]
        private static void AddComponent12() => AddScript("Assets/FireWorks/FireWorksScript.lua");
        [MenuItem("Component/Lua/Interact Script")]
        private static void AddComponent13() => AddScript("Assets/InteractScript.lua");
        [MenuItem("Component/Lua/Fountain Script")]
        private static void AddComponent14() => AddScript("Assets/Template/Art/Fountain/FountainScript.lua");
        [MenuItem("Component/Lua/Add R Bto Player")]
        private static void AddComponent15() => AddScript("Assets/Template/Art/Fountain/Puddle/AddRBtoPlayer.lua");
        [MenuItem("Component/Lua/Puddle Script")]
        private static void AddComponent16() => AddScript("Assets/Template/Art/Fountain/Puddle/PuddleScript.lua");
        [MenuItem("Component/Lua/Soda Fountain")]
        private static void AddComponent17() => AddScript("Assets/Template/Art/Fountain/SodaFountain/SodaFountain.lua");
        [MenuItem("Component/Lua/Avatar Controller Options")]
        private static void AddComponent18() => AddScript("Packages/com.pz.studio/Assets/Game/Lua/AvatarControllerOptions.lua");
        [MenuItem("Component/Lua/Highrise Camera Controller")]
        private static void AddComponent19() => AddScript("Packages/com.pz.studio/Assets/Game/Lua/HighriseCameraController.lua");
        [MenuItem("Component/Lua/RTS Camera")]
        private static void AddComponent20() => AddScript("Packages/com.pz.studio/Assets/Game/Lua/RTSCamera.lua");

    }
}

