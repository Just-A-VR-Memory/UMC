Started = false

function onLoad()
    base.LoadAssetBundle(string.gsub(base.GetFilePath(), "main.lua", "notacheat"))
    base.globalTickDelay = 0.01
end

function ADVR.onSpawnInHomeBase()
    Started = false
end

function ADVR.onGlobalTick()
    if Started and game.playerController.UiPointerEnabled == false then
        game.playerController.UiPointerEnabled = true
    end
end

function setupButton(path, pname, func)
	UI.transform.Find(path).gameObject.AddComponent(game.GetType("VibrateOnHighlight"))
	local buttonEvH = UI.transform.Find(path .. "/" .. pname).gameObject.AddComponent(game.GetType("LuaEventHandler")) ---@type LuaEventHandler
	buttonEvH.RegisterEventHandler(base)
	buttonEvH.AddListener("onEnable", func)
end

function ADVR.onDungeonGenerated(wgen)
    if helperMethods.IsInFirstDungeon(wgen) then
        Started = true
        UI = game.SpawnObject(base.GetObjectFromAssetBundle("NotACheatingUI", "UnityEngine.GameObject"), game.playerController.leftHand.transform.position)
        

        BaseUIls = game.INSTANCE.inventory.gameObject.GetComponentsInChildren(game.GetType("Canvas"))
        BaseUI = BaseUIls[0].gameObject ---@type GameObject
        NewCanvas = game.SpawnObject(BaseUI, vector3.zero)

        for i = NewCanvas.transform.childCount - 1, 0, -1 do
            local child = NewCanvas.transform.GetChild(i)
            game.Delete(child.gameObject)
        end


        local OldCanvas = UI.transform.Find("Canvas")
        for i = 0, OldCanvas.childCount - 1 do
            local child = OldCanvas.GetChild(0)
            child.SetParent(NewCanvas.transform, false)
            child.SetSiblingIndex(i)
        end


        local function delUIif()
            if UI.transform.Find("Canvas").transform.childCount == 0 then
                game.Delete(UI.transform.Find("Canvas").gameObject)
            else
                delUIif()
            end
        end
        delUIif()
        NewCanvas.transform.SetParent(UI.transform)

        UI.transform.SetParent(game.playerController.leftHand.handParent.transform)
        UI.transform.rotation = game.playerController.leftHand.handParent.transform.rotation
        UI.transform.position = game.playerController.leftHand.transform.position
        UI.transform.Find("CanvasLocal(Clone)").Rotate(vector3.__new(90, 0, 0))
        UI.transform.Find("CanvasLocal(Clone)").position = game.playerController.leftHand.transform.position
        UI.transform.Find("CanvasLocal(Clone)").localPosition = vector3.__new(0, 0.1, 5)
        UI.transform.localScale = vector3.__new(0.1, 0.1, 0.1)

        ----------Tabs-----------
        setupButton("CanvasLocal(Clone)/Spawners Tab Toggle", "E", "TabSwitchedSP")
        setupButton("CanvasLocal(Clone)/Troll Tab Toggle", "E", "TrTb")

        ------------Selections------------
        setupButton("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT", "E", "SpikesSelc")
        setupButton("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (1)", "E", "RelicsSelc")
        setupButton("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (2)", "E", "OrbsSelc")
        setupButton("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (3)", "E", "DGFSelc")
        setupButton("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (4)", "E", "WWZSelc")

        --------Positions--------
        setupButton("CanvasLocal(Clone)/Troll Tab/PlayerBT1", "E", "SPS")
        setupButton("CanvasLocal(Clone)/Troll Tab/PlayerBT2", "E", "OnePS")
        setupButton("CanvasLocal(Clone)/Troll Tab/PlayerBT3", "E", "TwoPS")
        setupButton("CanvasLocal(Clone)/Troll Tab/PlayerBT4", "E", "ThreePS")

        setupButton("CanvasLocal(Clone)/Troll Tab/Head", "E", "SHead")
        setupButton("CanvasLocal(Clone)/Troll Tab/HandL", "E", "SHandL")
        setupButton("CanvasLocal(Clone)/Troll Tab/HandR", "E", "SHandR")
        setupButton("CanvasLocal(Clone)/Troll Tab/Body", "E", "SBody")

        game.Delete(UI.transform.Find("CanvasLocal(Clone)/Misc Tab Toggle").gameObject)

        GiveRelic("UMC_thing")
    end
end

function GiveRelic(id)
    pickup = game.itemInterpreter.GetPickupById(id)
    pickup.Execute("onPickup", nil)
end

function TabSwitchedSP()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab Toggle/E").gameObject.SetActive(false)
end

function TrTb()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab Toggle/E").gameObject.SetActive(false)
end

function SpikesSelc()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT/E").gameObject.SetActive(false)
    game.SaveString("UMC-Selc", objects.EFFECT_SPIKE_ATTACK_CIRCULAR)
end

function RelicsSelc()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (1)/E").gameObject.SetActive(false)
    game.SaveString("UMC-Selc", objects.ITEM_UPGRADE_ALL)
end

function OrbsSelc()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (2)/E").gameObject.SetActive(false)
    game.SaveString("UMC-Selc", objects.ITEM_ORB)
end

function DGFSelc()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (3)/E").gameObject.SetActive(false)
    game.SaveString("UMC-Selc", objects.ITEM_FOOD_DRAGONFRUIT)
end

function WWZSelc()
    UI.transform.Find("CanvasLocal(Clone)/Spawners Tab/Scroll View/Viewport/Content/OptionBT (3)/E").gameObject.SetActive(false)
    game.SaveString("UMC-Selc", objects.ENEMY_OG_WIGHT)
end

function SPS()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/PlayerBT1/E").gameObject.SetActive(false)
    game.SaveString("UMC-PosP", "Self")
end

function OnePS()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/PlayerBT2/E").gameObject.SetActive(false)
    game.SaveString("UMC-PosP", "1")
end

function TwoPS()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/PlayerBT3/E").gameObject.SetActive(false)
    game.SaveString("UMC-PosP", "2")
end


function ThreePS()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/PlayerBT4/E").gameObject.SetActive(false)
    game.SaveString("UMC-PosP", "3")
end

function SHead()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/Head/E").gameObject.SetActive(false)
    if game.LoadString("UMC-PosP", "Self")  == "Self" then
        game.SaveString("UMC-Pos", "SH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "1" then
        game.SaveString("UMC-Pos", "1H")
    end
    if game.LoadString("UMC-PosP", "Self")  == "2" then
        game.SaveString("UMC-Pos", "2H")
    end
    if game.LoadString("UMC-PosP", "Self")  == "3" then
        game.SaveString("UMC-Pos", "3H")
    end
end

function SHandL()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/HandL/E").gameObject.SetActive(false)
    if game.LoadString("UMC-PosP", "Self")  == "Self" then
        game.SaveString("UMC-Pos", "SLH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "1" then
        game.SaveString("UMC-Pos", "1LH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "2" then
        game.SaveString("UMC-Pos", "2LH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "3" then
        game.SaveString("UMC-Pos", "3LH")
    end
end

function SHandR()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/HandL/E").gameObject.SetActive(false)
    if game.LoadString("UMC-PosP", "Self")  == "Self" then
        game.SaveString("UMC-Pos", "SRH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "1" then
        game.SaveString("UMC-Pos", "1RH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "2" then
        game.SaveString("UMC-Pos", "2RH")
    end
    if game.LoadString("UMC-PosP", "Self")  == "3" then
        game.SaveString("UMC-Pos", "3RH")
    end
end

function SBody()
    UI.transform.Find("CanvasLocal(Clone)/Troll Tab/HandL/E").gameObject.SetActive(false)
    if game.LoadString("UMC-PosP", "Self")  == "Self" then
        game.SaveString("UMC-Pos", "SB")
    end
    if game.LoadString("UMC-PosP", "Self")  == "1" then
        game.SaveString("UMC-Pos", "1B")
    end
    if game.LoadString("UMC-PosP", "Self")  == "2" then
        game.SaveString("UMC-Pos", "2B")
    end
    if game.LoadString("UMC-PosP", "Self")  == "3" then
        game.SaveString("UMC-Pos", "3B")
    end
end