function onLoad()
	pickup.name = "Spawn shit"
	pickup.desc = "Does Literally That"
	pickup.probability = 0
	pickup.maxAmount = -1
	pickup.amountUses = -1
	pickup.tier = 1
	pickup.price = 9999999
	pickup.spawnsIn = {}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function onPickup()
	pickup.RegisterUsable()
end

function onPickupActivate()
	if game.LoadString("UMC-Pos", "SRH") == "SRH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.playerController.rightHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "SLH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.playerController.leftHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "SH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.playerHeadset.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "SB" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), player.networkObject.transform.position)
    end


    if game.LoadString("UMC-Pos", "SRH") == "1RH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[1].playerController.rightHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "1LH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[1].playerController.leftHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "1H" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[1].playerHead.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "1B" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[1].spawnedPlayer.transform.position)
    end


    if game.LoadString("UMC-Pos", "SRH") == "2RH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[2].playerController.rightHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "2LH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[2].playerController.leftHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "2H" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[2].playerHead.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "2B" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[2].spawnedPlayer.transform.position)
    end


    if game.LoadString("UMC-Pos", "SRH") == "3RH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[3].playerController.rightHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "3LH" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[3].playerController.leftHand.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "3H" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[3].playerHead.transform.position)
    end
    if game.LoadString("UMC-Pos", "SRH") == "3B" then
        game.SpawnObjectNetwork(game.LoadString("UMC-Selc", objects.ITEM_UPGRADE_ALL), game.GetAllPlayersArray()[3].spawnedPlayer.transform.position)
    end
end