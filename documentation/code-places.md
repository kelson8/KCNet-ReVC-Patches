# Useful things in the code
Here is a list of things that seem to constantly run and can be used for events:

CGame::Process - This processes pretty much everything for the game, list of items it processes:
* CCutsceneMgr
* CTheZones
* CStreaming
* Set CWindModifiers to 0

<details>
<summary> If the game is not paused (!CTimer::GetIsPaused()) </summary>

        CSprite2d::SetRecipNearClip
        CSprite2d::InitPerFrame
        CFont::InitPerFrame

		// Run the cheats
		CPad::DoCheats
		// Update the clock
		CClock::Update

        // Update the weather
		CWeather::Update
		
        CTheScripts::Process
		CCollision::Update
		CScriptPaths::Update
		CTrain::UpdateTrains();
		CPlane::UpdatePlanes();
		CHeli::UpdateHelis();
		CDarkel::Update();
		CSkidmarks::Update();
		CAntennas::Update();
		CGlass::Update();
		CSceneEdit::Update();
		CSetPieces::Update();
		CEventList::Update();
		CParticle::Update();
		gFireManager.Update();
        
        CPopulation::Update(false);
        CWeapon::UpdateWeapons();

		// Only if CCutsceneMgr or CReplay not running, process the car generators and cranes.
		if (!CCutsceneMgr::IsRunning())
			CTheCarGenerators::Process();
		if (!CReplay::IsPlayingBack())
			CCranes::UpdateCranes();

		CClouds::Update();
		CMovingThings::Update();
		CWaterCannons::Update();
		CUserDisplay::Process();
		CReplay::Update();

        CWorld::Process();

		gAccidentManager.Update();
		CPacManPickups::Update();
		CPickups::Update();
		CGarages::Update();
		CRubbish::Update();
		CSpecialFX::Update();
		CRopes::Update();
		CTimeCycle::Update();

		if (CReplay::ShouldStandardCameraBeProcessed())
			TheCamera.Process();
		CCullZones::Update();
		if (!CReplay::IsPlayingBack())
			CGameLogic::Update();

		CBridge::Update();
		CCoronas::DoSunAndMoon();
		CCoronas::Update();
		CShadows::UpdateStaticShadows();
		CShadows::UpdatePermanentShadows();
		gPhoneInfo.Update();

		if (!CReplay::IsPlayingBack())
		{
			if (processTime < 2)
				CCarCtrl::GenerateRandomCars();
			CRoadBlocks::GenerateRoadBlocks();
			CCarCtrl::RemoveDistantCars();
			CCarCtrl::RemoveCarsIfThePoolGetsFull();
		}

</details>

<details>
<summary> CPed </summary>

</details>

<details>
<summary> CAutomobile </summary>

* ProcessControl - This seems to process the control for all vehicles, possibly mostly for the ped vehicles.
* Teleport - A teleport function for vehicles, TODO Use this in cleo redux.


</details>

<details>
<summary> CVehicle </summary>

* IsLawEnforcementVehicle - Check if the vehicle is a cop car, enforcer, predator, rhino, barracks, fbi rancher, or vice chee.


</details>



<details>
<summary> CWanted </summary>

</details>