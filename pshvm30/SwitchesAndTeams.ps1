#######################
## SwitchesAndTeams 1.1
##
## SwitchesAndTeams.ps1
## Last revision date 6/1
##
## Author: Eric Siron
## (C) 2013 Altaro Software
##
## A tool to create teams, virtual switches, and virtual adapters.
## Also enables setting of IP addresses.
##

#Region Initialize Environment
#Requires -Version 3

## Script Variables ##
Import-LocalizedData -BindingVariable LocalStrings -FileName SwitchesAndTeams.psd1
$WindowWidth = $Host.UI.RawUI.WindowSize.Width
$WindowHeight = $Host.UI.RawUI.WindowSize.Height
$VSwitchAvailable = $false		# indicates whether or not a Hyper-V virtual switch can be created/manipulated
$CopyrightStamp = $LocalStrings.Copyright
$BackColor = "Black"
$ForeColor = "Green"
$BackColorHeader = "White"
$ForeColorHeader = "DarkBlue"
$ForeColorExitAndWarnings = "Yellow"

# Check for Hyper-V
try
{
	# if the virtualization\v2 namespace exists, the Hyper-V virtual switch is available
	gwmi -Namespace root\virtualization\v2 -Class __NAMESPACE -ErrorAction Stop | Out-Null
	$VSwitchAvailable = $true
}
catch
{ # nothing to handle, this isn't an actual error situation
}
#EndRegion Initialize Environment

# converts dotted-notation subnet masks to CIDR-notation or validates that CIDR-notation subnet masks are in the correct range
function Validate-Subnet([String]$InputVal)	# Modified from Corefig 1 code
{
	$SubnetLookup = New-Object System.Collections.Specialized.StringCollection
	$SubnetLookup += "Invalid"
	$SubnetLookup += "128.0.0.0"
	$SubnetLookup += "192.0.0.0"
	$SubnetLookup += "224.0.0.0"
	$SubnetLookup += "240.0.0.0"
	$SubnetLookup += "248.0.0.0"
	$SubnetLookup += "252.0.0.0"
	$SubnetLookup += "254.0.0.0"
	$SubnetLookup += "255.0.0.0"
	$SubnetLookup += "255.128.0.0"
	$SubnetLookup += "255.192.0.0"
	$SubnetLookup += "255.224.0.0"
	$SubnetLookup += "255.240.0.0"
	$SubnetLookup += "255.248.0.0"
	$SubnetLookup += "255.252.0.0"
	$SubnetLookup += "255.254.0.0"
	$SubnetLookup += "255.255.0.0"
	$SubnetLookup += "255.255.128.0"
	$SubnetLookup += "255.255.192.0"
	$SubnetLookup += "255.255.224.0"
	$SubnetLookup += "255.255.240.0"
	$SubnetLookup += "255.255.248.0"
	$SubnetLookup += "255.255.252.0"
	$SubnetLookup += "255.255.254.0"
	$SubnetLookup += "255.255.255.0"
	$SubnetLookup += "255.255.255.128"
	$SubnetLookup += "255.255.255.192"
	$SubnetLookup += "255.255.255.224"
	$SubnetLookup += "255.255.255.240"
	$SubnetLookup += "255.255.255.248"
	$SubnetLookup += "255.255.255.252"
	$SubnetLookup += "255.255.255.254"
	$SubnetLookup += "255.255.255.255"

	if ($InputVal -match "\.")	# treat like a subnet mask wanting a CIDR; return "Invalid" if garbage in
	{
		$TestVal = $SubnetLookup.IndexOf($InputVal)
		if($TestVal -eq -1)
		{ return $SubnetLookup[0] }
		else { return $TestVal }
	}
	else	# make sure it's in the proper range
	{
		if([int]$InputVal -gt 0 -and [int]$InputVal -le 32)
		{ return $InputVal }
		else { return $SubnetLookup[0] }
	}
}

# removes all IPv4 information from an adapter by name
function Clear-IPInfo([String]$AdapterName)
{
	Write-Host $LocalStrings.ClearingInfo
	Remove-NetIPAddress -InterfaceAlias $AdapterName -Confirm:$false
	Remove-NetRoute -InterfaceAlias $AdapterName -Confirm:$false -ErrorAction SilentlyContinue	# remove gateway(s)
	Set-DNSClientServerAddress -InterfaceAlias $AdapterName -ResetServerAddresses				# clear DNS servers
	[System.Threading.Thread]::Sleep(500)														# give it enough time to remove the IP
}

# applies input IPv4 information to an adapter by name
function Set-IPInfo([String]$AdapterName, [String]$IPAddress, [String]$NetMask, [String]$Gateway = "", [String]$DNSServers = "", [bool]$RegisterInDNS = $true)
{
	try
	{
		Clear-IPInfo -AdapterName $AdapterName
		$NetMask = Validate-Subnet -InputVal $NetMask
		if($NetMask -eq "Invalid")
		{ throw ($LocalStrings.InvalidMask) }
		Set-DnsClient -InterfaceAlias $AdapterName -RegisterThisConnectionsAddress $RegisterInDNS			# to prevent a registration/deregistration attempt, set this first
		$IPCommand = "New-NetIPAddress -InterfaceAlias '" + $AdapterName + "' -IPAddress " + $IPAddress + " -PrefixLength " + $NetMask + " -Confirm:0"
		if($Gateway.Length -gt 0)
		{ $IPCommand += " -DefaultGateway " + $Gateway }
		Invoke-Expression $IPCommand
		if($DNSServers.Length -gt 0)
		{ Set-DNSClientServerAddress -InterfaceAlias $AdapterName -ServerAddresses (($DNSServers.Split(","))) }
	}
	catch
	{
		Write-Host $_ -ForegroundColor $ForeColorExitAndWarnings
		Read-Host $LocalStrings.FailureFinish
	}
}

# displays a series of prompts to collect IPv4 information for a named adapter
function Prompt-ForIPInformation([String]$AdapterName)
{
	Write-Host ($LocalStrings.EnteringIPForAdapter -f $AdapterName)
	$IPAddress = Read-Host $LocalStrings.RequestIP									# allow the PS cmdlet to validate the IP
	$SubnetMask = Read-Host $LocalStrings.RequestSubnetMask
	$Gateway = Read-Host $LocalStrings.RequestGateway
	$DNSServers = Read-Host $LocalStrings.RequestDNS
	$DNSServers = $DNSServers.Replace(" ", "")
	$RegisterResponse = Read-Host $LocalStrings.RequestDNSRegister
	if($RegisterResponse.Length -gt 0 -and $RegisterResponse[0].ToString().ToLower() -eq "n")
	{ $RegisterDNS = $false }
	else { $RegisterDNS = $true }
	$Confirmation = Read-Host $LocalStrings.ConfirmIPChange
	if($Confirmation.Length -eq 0 -or $Confirmation[0].ToString().ToLower() -ne "n")
	{ Set-IPInfo -AdapterName $AdapterName -IPAddress $IPAddress -NetMask $SubnetMask -Gateway $Gateway -DNSServers $DNSServers -RegisterInDNS $RegisterDNS }
}

# displays a formatted menu
function Show-Menu([String]$MenuTitle, [String[]]$ArrayOfOptions, [String]$BackMenuText = $LocalStrings.BackMenu, [String]$AdditionalInfo = "", [System.Management.Automation.SwitchParameter]$NoCancel)
{
	$HeaderString = New-Object System.Text.StringBuilder(6 * $WindowWidth)
	$MenuString = New-Object System.Text.StringBuilder($WindowWidth * $WindowHeight)
	$LineBar = " " + ("-" * ($WindowWidth - 3) + " ")
	$Host.UI.RawUI.WindowTitle = $MenuTitle
	$HeaderString.AppendLine($LineBar) | Out-Null
	$HeaderString.AppendLine("|" + $MenuTitle.PadLeft(($MenuTitle.Length / 2) + ($WindowWidth / 2)).PadRight($WindowWidth - 3) + "|") | Out-Null
	$HeaderString.AppendLine("|" + "".PadLeft($WindowWidth / 2).PadRight($WindowWidth - 3) + "|") | Out-Null
	$HeaderString.AppendLine("|" + $CopyrightStamp.PadLeft(($CopyrightStamp.Length / 2) + ($WindowWidth / 2)).PadRight($WindowWidth - 3) + "|") | Out-Null
	$HeaderString.AppendLine($LineBar) | Out-Null
	$HeaderString.AppendLine() | Out-Null
	if($ArrayOfOptions.Count -gt 0)
	{
		$ArrayOfOptions | ForEach -Begin { $i = 0} -Process {
			$i += 1
			$Line = " [" + $i + "] " + $_
			if($Line.Length -gt ($WindowWidth - 4))
			{ $Line = ($Line.Substring(0, ($WindowWidth - 7)) + "...") }
			$MenuString.AppendLine($Line) | Out-Null
		}
	}
	if($AdditionalInfo.Length -gt 0)
	{ $MenuString.AppendLine("`r`n $AdditionalInfo") | Out-Null	}

	Clear-Host
	Write-Host -ForegroundColor $ForeColorHeader -BackgroundColor $BackColorHeader $HeaderString.ToString()
	Write-Host -ForegroundColor $ForeColor -BackgroundColor $BackColor $MenuString.ToString()
	if(-not $NoCancel)
	{ Write-Host -ForegroundColor $ForeColorExitAndWarnings -BackgroundColor $BackColor " [0] $BackMenuText" }
	return (Read-Host -Prompt $LocalStrings.SelectOption)
}

# the main menu for teaming functions
function Display-MainTeamMenu
{
	while ($MenuOption -ne 0)
	{
		# selections: 1: Create team, 2: Delete team, 3: Set team adapter IP, 4: Remove team adapter IP
		$Selections = @($LocalStrings.CreateTeamOption, $LocalStrings.DeleteTeamOption, $LocalStrings.SetTeamIP, $LocalStrings.RemoveTeamIP, $LocalStrings.ShowTeams)
		$MenuOption = Show-Menu -MenuTitle $LocalStrings.MainTeamTitle -ArrayOfOptions $Selections
		switch -regex ($MenuOption)
		{
			1 { # Create team
				$SelectionOption = 99
				$NewTeamName = ""
				$NewTeamNICName = ""
				$TeamAdapters = @()
				$TeamAdapterString = ""
				$TeamingMode = 0	# 1 = LACP, 2 = Static, 3 = Switch Independent
				$LoadBalancingAlgorithm = 0	# 1 = HyperVPorts, 2 = TransportPorts, 3 = IP Addresses, 4 = MAC Addresses
				$ConfirmationString = New-Object System.Text.StringBuilder($WindowWidth * $WindowHeight / 2)
				Clear-Host
				while ($NewTeamName -eq "")
				{ $NewTeamName = Read-Host $LocalStrings.ChooseTeamName }
				$NewTeamNICName = Read-Host ($LocalStrings.ChooseTeamNICName -f $NewTeamName)
				if ($NewTeamNICName.Length -eq 0)
				{ $NewTeamNICName = $NewTeamName }
				Clear-Host
				Write-Host $LocalStrings.LoadingAdapters
				if($VSwitchAvailable) { $ProtocolList = @("ms_implat", "vms_pp") }
				else { $ProtocolList = "ms_implat" }
				$AdapterList = Get-NetAdapter -Physical | Where-Object { (Get-NetAdapterBinding -Name $_.Name -ComponentID $ProtocolList).Enabled -eq $false }
				$AdapterList | ForEach-Object -Begin { $i = 0 } -Process {
					$i += 1
					$AvailableAdapters += , ($i, $_.Name, $_.InterfaceIndex, $_.InterfaceDescription, $false)
					$DisplayAvailableAdapters += , ($_.Name + ": " + $_.InterfaceDescription)
				}
				$AdditionalInfo = ""
				while ($SelectionOption -ne 0)
				{
					$AtLeastOneAdapterSelected = $false
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.AdapterListTitle -ArrayOfOptions $DisplayAvailableAdapters -BackMenuText $LocalStrings.ContinueTeamCreation -AdditionalInfo $AdditionalInfo
					$DisplayAvailableAdapters = @()
					foreach ($Item in $AvailableAdapters)
					{
						if($Item[0] -eq $SelectionOption)
						{
							$Item[4] = -bnot $Item[4]
						}
						if($Item[4])
						{
							$PrefixText = "(Selected) "
							$AtLeastOneAdapterSelected = $true
						}
						else
						{ $PrefixText = "" }
						$DisplayAvailableAdapters += ($PrefixText + $Item[1] + ": " + $Item[3])
					}
					if($SelectionOption -eq 0 -and -not $AtLeastOneAdapterSelected)
					{
						if($AvailableAdapters.Count -eq 0)
						{ return }
						$SelectionOption = 99
						$AdditionalInfo = $LocalStrings.NoAdaptersSelected
					}
					else { $AdditionalInfo = "" }
				}
				$TeamAdapterNames = @()
				$AvailableAdapters | ForEach-Object -Process {
					if ($_[4])
					{
						$TeamAdapters += Get-NetAdapter -Name $_[1]
						$TeamAdapterNames += $_[1]
					}
					$TeamAdapterString = [System.String]::Join(", ", $TeamAdapterNames)
				}
				$Selections = @($LocalStrings.TeamingModeLACP, $LocalStrings.TeamingModeStatic, $LocalStrings.TeamingModeSwitchIndependent)
				while ($SelectionOption -notmatch "[1-3]")
				{
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.TeamingModeTitle -ArrayOfOptions $Selections -NoCancel
					switch ($SelectionOption)
					{
						1 { $TeamingMode = "LACP" }
						2 { $TeamingMode = "Static" }
						3 { $TeamingMode = "SwitchIndependent" }
					}
				}
				$SelectionOption = 99
				$Selections = @($LocalStrings.LBAHyperVPorts, $LocalStrings.LBATransportPorts, $LocalStrings.LBAIPAddresses, $LocalStrings.LBAMACAddresses)
				while ($SelectionOption -notmatch "[1-4]")
				{
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.LBATitle -ArrayOfOptions $Selections -NoCancel
					switch ($SelectionOption)
					{
						1 { $LoadBalancingAlgorithm = "HyperVPort" }
						2 { $LoadBalancingAlgorithm = "TransportPorts" }
						3 { $LoadBalancingAlgorithm = "IPAddresses" }
						4 { $LoadBalancingAlgorithm = "MACAddresses" }
					}
				}

				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamHeader) | Out-Null
				$ConfirmationString.AppendLine() | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamName -f $NewTeamName) | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamNICName -f $NewTeamNICName) | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamMembers -f $TeamAdapterString) | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamMode -f $TeamingMode) | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamLBA -f $LoadBalancingAlgorithm) | Out-Null
				Clear-Host
				Write-Host $ConfirmationString.ToString()
				Write-Warning $LocalStrings.TeamWarning
				$Response = Read-Host $LocalStrings.ConfirmTeamConfirmation
				if($Response.Length -gt 0 -and ($Response[0]).ToString().ToLower() -eq "y")
				{
					try
					{
						Write-Host $LocalStrings.TeamCreationInProgress
						New-NetLbfoTeam -Name $NewTeamName -TeamNicName $NewTeamNICName -TeamMembers $TeamAdapterNames -TeamingMode $TeamingMode -LoadBalancingAlgorithm $LoadBalancingAlgorithm -Confirm:$false -ErrorAction Stop | Out-Null
					}
					catch
					{
						Write-Error $_
						Read-Host $LocalStrings.FailureFinish
					}
				}
			}
			2 { # Delete team
				$SelectionOption = 99
				while($SelectionOption -ne 0)
				{
					$DisplayLBFOTeams = @()
					$TrackLBFOTeams = @()
					Clear-Host
					Write-Host $LocalStrings.LoadingTeams
					$LBFOTeams = Get-NetLbfoTeam
					$LBFOTeams | ForEach-Object -Begin { $i = 1 } -Process {
						$DisplayLBFOTeams += ($_.Name + ": {0}" -f [System.String]::Join(", ", $_.Members))
						$TrackLBFOTeams += , @($i, $_.Name)
					}
					if($DisplayLBFOTeams.Count -eq 0)
					{ $AdditionalInfo = $LocalStrings.NoTeamsToDelete }
					else { $AdditionalInfo = $LocalStrings.SwitchDeletionWarning }
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.TeamDeleteTitle -ArrayOfOptions $DisplayLBFOTeams -AdditionalInfo $AdditionalInfo
					foreach($AdapterItem in $TrackLBFOTeams)
					{
						if($AdapterItem[0] -eq $SelectionOption)
						{
							try
							{
								Remove-NetLbfoTeam -Name $AdapterItem[1] -ErrorAction Stop
							}
							catch
							{
								Write-Error $_
								Read-Host $LocalStrings.FailureFinish
							}
						}
					}
				}
			}
			[3-4] { # Add or remove IP information on team adapter
				$SelectionOption = 99
				if($MenuOption -eq 3)
				{ $ScreenTitle = $LocalStrings.SetTeamIPTitle }
				else
				{ $ScreenTitle = $LocalStrings.RemoveTeamIPTitle }
				while($SelectionOption -ne 0)
				{
					Clear-Host
					Write-Host $LocalStrings.LoadingAdapters
					$DisplayAdapters = @()
					$TrackAdapters = @()
					$AdapterList = @()
					$SelectedAdapter = ""
					$i = 0
					foreach ($Team in Get-NetLbfoTeam)
					{
						foreach ($Adapter in $Team.TeamNics)
						{
							if ($_.Name -ne $null -and (Get-NetAdapterBinding -Name $_.Name -ComponentID vms_pp).Enabled -ne $true)
							{
								$i += 1
								$DisplayIPAddress = (Get-NetIPAddress -InterfaceAlias $Adapter -AddressFamily IPv4).IPAddress
								$DisplayAdapters += ($Adapter + ": " + $DisplayIPAddress)
								$TrackAdapters += , @($i, $Adapter)
							}
						}
					}
					$SelectionOption = Show-Menu -MenuTitle $ScreenTitle -ArrayOfOptions $DisplayAdapters -AdditionalInfo $LocalStrings.TeamAdapterWarning
					foreach ($Adapter in $TrackAdapters)
					{
						if($Adapter[0] -eq $SelectionOption)
						{ $SelectedAdapter = $Adapter[1] }
					}
					if($SelectedAdapter.Length -gt 0)
					{
						if($MenuOption -eq 3)
						{
							Prompt-ForIPInformation -AdapterName $SelectedAdapter
						}
						else
						{
							Clear-IPInfo -AdapterName $SelectedAdapter
						}
					}
				}
			}
			5 { # Show teams
				Clear-Host
				Write-Host $LocalStrings.LoadingTeams
				$OutText = Get-NetLbfoTeam | ft
				Clear-Host
				Write-Output $OutText
				Read-Host $LocalStrings.FailureFinish
			}
		}
	}
}

# main menu for virtual switch and adapters
function Display-MainSwitchesMenu
{
	while ($MenuOption -ne 0)
	{
		$Selections = @($LocalStrings.CreateSwitchOption, $LocalStrings.DeleteSwitchOption, $LocalStrings.AddVN, $LocalStrings.RemoveVN, $LocalStrings.SetVNIP, $LocalStrings.RemoveVNIP, $LocalStrings.SetVNVLAN, $LocalStrings.ShowSwitchesAndAdapters)
		$MenuOption = Show-Menu -MenuTitle $LocalStrings.MainSwitchTitle -ArrayOfOptions $Selections
		switch -regex ($MenuOption)
		{
			1 { # Create virtual switch
				$SelectionOption = 99
				$NewSwitchName = ""
				$AdapterName = ""
				$QoSMode = ""	# 0 = None, 1 = Absolute, 2 = Relative
				$EnableSRIOV = 0
				$ConfirmationString = New-Object System.Text.StringBuilder($WindowHeight * $WindowWidth / 2)
				$SwitchTypeParameters = ""
				Clear-Host
				$NewSwitchName = Read-Host $LocalStrings.ChooseSwitchName
				Clear-Host
				$DisplayAvailableAdapters = @()
				$TrackAvailableAdapters = @()
				Write-Host $LocalStrings.LoadingAdapters
				$AdapterList = Get-NetAdapter | Where-Object { (Get-NetAdapterBinding -Name $_.Name -ComponentID vms_pp, ms_implat).Enabled -eq $false -and $_.DriverFileName -ne "vmswitch.sys" }
				$AdapterList | ForEach-Object -Begin { $i = 0 } -Process {
					$i += 1
					$DisplayAvailableAdapters += $_.Name + " (" + $_.InterfaceDescription + ")"
					$TrackAvailableAdapters += , @($i, $_.Name)
				}
				while ($SelectionOption -ne 0)
				{
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.AdapterListTitle -ArrayOfOptions $DisplayAvailableAdapters -BackMenuText $LocalStrings.ContinueSwitchCreation
					if($SelectionOption -ne 0)
					{
						foreach($AdapterItem in $TrackAvailableAdapters)
						{
							if ($AdapterItem[0] -eq $SelectionOption)
							{
								$AdapterName = $AdapterItem[1]
								$SelectionOption = 0
							}
						}
					}
				}
				$SelectionOption = 99
				$Selections = @($LocalStrings.SwitchQoSAbsolute, $LocalStrings.SwitchQoSRelative)
				while ($SelectionOption -notmatch "[0-3]")
				{
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.SwitchQoSTitle -ArrayOfOptions $Selections -BackMenuText $LocalStrings.SwitchQoSNone -AdditionalInfo $LocalStrings.SwitchQoSWarningPermanent
					switch ($SelectionOption)
					{
						0 { $QoSMode = "None" }
						1 { $QoSMode = "Absolute" }
						2 { $QoSMode = "Weight" }
					}
				}
				if($AdapterName.Length -gt 0)
				{
					$SelectionOption = 99
					$Selections = @($LocalStrings.SwitchIOVEnabled, $LocalStrings.SwitchIOVDisabled)
					while ($SelectionOption -notmatch "[1-2]")
					{
						$SelectionOption = Show-Menu -MenuTitle $LocalStrings.SwitchIOVTitle -ArrayOfOptions $Selections -NoCancel -AdditionalInfo $LocalStrings.SwitchIOVWarning
						if($SelectionOption -eq 1)
						{
							$EnableSRIOV = 1
						}
					}
				}
				$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchHeader) | Out-Null
				$ConfirmationString.AppendLine() | Out-Null
				$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchName -f $NewSwitchName) | Out-Null
				if ($AdapterName.Length -gt 0)
				{
					$ConfirmationString.AppendLine($LocalStrings.ConfirmTeamNICName -f $AdapterName) | Out-Null
					$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchTypeExternal) | Out-Null
					$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchIOV -f [bool]$EnableSRIOV) | Out-Null
					$SwitchTypeParameters = "-AllowManagementOS 0 -NetAdapterName '$AdapterName' -EnableIov $EnableSRIOV"
				}
				else
				{
					$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchTypePrivate) | Out-Null
					$SwitchTypeParameters = "-SwitchType Private"
				}
				$ConfirmationString.AppendLine($LocalStrings.ConfirmSwitchQoSMode -f $QoSMode) | Out-Null
				Clear-Host
				Write-Host $ConfirmationString.ToString()
				if($AdapterName.Length -gt 0)
				{ Write-Warning $LocalStrings.SwitchWarning }
				$Response = Read-Host $LocalStrings.ConfirmSwitchConfirmation
				if($Response.Length -gt 0 -and ($Response[0]).ToString().ToLower() -eq "y")
				{
					try
					{
						Write-Host $LocalStrings.SwitchCreationInProgress
						Invoke-Expression "New-VMSwitch -Name '$NewSwitchName' $SwitchTypeParameters -MinimumBandwidthMode $QoSMode -ErrorAction Stop | Out-Null"
					}
					catch
					{
						Write-Error $_
						Read-Host $LocalStrings.FailureFinish
					}
				}
			}
			2 { # Remove virtual switch
				$SelectionOption = 99
				while ($SelectionOption -ne 0)
				{
					$DisplaySwitches = @()
					$TrackSwitches = @()
					Clear-Host
					Write-Host $LocalStrings.LoadingSwitches
					Get-VMSwitch | ForEach-Object -Begin { $i = 0} -Process {
						$i += 1
						$DisplaySwitches += $_.Name
						$TrackSwitches += , @($i, $_.Name)
					}
					if($DisplaySwitches[0].Length -eq 0)
					{	$AdditionalInfo = $LocalStrings.NoSwitchToDelete }
					else { $AdditionalInfo = $LocalStrings.SwitchDeletionWarning }
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.SwitchDeletionTitle -ArrayOfOptions $DisplaySwitches -AdditionalInfo $AdditionalInfo
					foreach ($SwitchItem in $TrackSwitches)
					{
						if($SwitchItem[0] -eq $SelectionOption)
						{
							try
							{
								Remove-VMSwitch -Name $SwitchItem[1]
							}
							catch
							{
								Write-Error $_
								Read-Host $LocalStrings.FailureFinish
							}
						}
					}
				}
			}
			3 {
				$SelectionOption = 99
				$DisplaySwitches = @()
				$TrackSwitches = @()
				$SelectedSwitch = ""
				$VNName = ""
				Clear-Host
				Write-Host $LocalStrings.LoadingSwitches
				(Get-VMSwitch).Name | ForEach-Object -Begin { $i = 0 } -Process {
					$i += 1
					$DisplaySwitches += $_
					$TrackSwitches += , @($i, $_)
				}
				while ($SelectionOption -ne 0)
				{
					if ($DisplaySwitches[0].Length -gt 0)
					{ $SelectionOption = Show-Menu -MenuTitle $LocalStrings.AddVNTitle -ArrayOfOptions $DisplaySwitches }
					else
					{ $SelectionOption = Show-Menu -MenuTitle $LocalStrings.AddVNTitle -AdditionalInfo $LocalStrings.NoSwitchForVN }
					foreach ($SwitchItem in $TrackSwitches)
					{
						if($SelectionOption -eq $SwitchItem[0])
						{
							$SelectedSwitch = $SwitchItem[1]
							Clear-Host
							$VNName = Read-Host $LocalStrings.NewVNName
							try
							{
								Write-Host ($LocalStrings.AddingAdapter -f $VNName, $SelectedSwitch)
								Add-VMNetworkAdapter -SwitchName $SelectedSwitch -Name $VNName -ManagementOS
							}
							catch
							{
								Write-Host $_ -ForegroundColor $ForeColorExitAndWarnings
								Read-Host $LocalStrings.FailureFinish
							}
						}
					}
				}
			}
			4 {
				$SelectionOption = 99
				while ($SelectionOption -ne 0)
				{
					$DisplayAdapters = @()
					$TrackAdapters = @()
					$SelectedAdapter = ""
					Clear-Host
					Write-Host $LocalStrings.LoadingAdapters
					(Get-VMNetworkAdapter -ManagementOS).Name | ForEach-Object -Begin { $i = 0 } -Process {
						$i += 1
						$DisplayAdapters += $_
						$TrackAdapters += , @($i, $_)
					}
					if ($DisplayAdapters[0].Length -gt 0)
					{ $SelectionOption = Show-Menu -MenuTitle $LocalStrings.RemoveVNTitle -ArrayOfOptions $DisplayAdapters }
					else
					{ $SelectionOption = Show-Menu -MenuTitle $LocalStrings.RemoveVNTitle -AdditionalInfo $LocalStrings.NoVNToRemove }
					foreach ($AdapterItem in $TrackAdapters)
					{
						if($SelectionOption -eq $AdapterItem[0])
						{
							$Response = Read-Host ($LocalStrings.ConfirmVNRemoval -f $AdapterItem[1])
							if($Response.Length -gt 0 -and $Response[0].ToString().ToLower() -eq "y")
							{
								try
								{
									Remove-VMNetworkAdapter -ManagementOS -Name $AdapterItem[1]
								}
								catch
								{
									Write-Host $_ -ForegroundColor $ForeColorExitAndWarnings
									Read-Host $LocalStrings.FailureFinish
								}
							}
						}
					}
				}
			}
			[5-6] { # Set or Remove IP information on a virtual adapter
				$SelectionOption = 99
				if($MenuOption -eq 5)
				{ $ScreenTitle = $LocalStrings.SetVNIPTitle }
				else
				{ $ScreenTitle = $LocalStrings.RemoveVNIPTitle }
				while($SelectionOption -ne 0)
				{
					$DisplayAdapters = @()
					$VMNetDeviceIDs = @()
					$TrackAdapters = @()
					$AdapterList = @()
					$SelectedAdapter = ""
					$i = 0
					Clear-Host
					Write-Host $LocalStrings.LoadingAdapters
					(Get-VMNetworkAdapter -ManagementOS).DeviceID | ForEach-Object { $VMNetDeviceIDs += $_ }	 # collect device ID's for comparison; very slow operation
					foreach ($Adapter in (Get-NetAdapter | Where-Object { $VMNetDeviceIDs.Contains($_.DeviceID) } ).Name)	# get adapters with a device ID among the virtual adapters; ensures only virtual adapters are selectable
					{
						$i += 1
						$DisplayIPAddress = (Get-NetIPAddress -InterfaceAlias $Adapter -AddressFamily IPv4).IPAddress
						$DisplayAdapters += ($Adapter + ": " + $DisplayIPAddress)
						$TrackAdapters += , @($i, $Adapter)
					}
					if ($DisplayAdapters[0].Length -gt 0)
					{ $SelectionOption = Show-Menu -MenuTitle $ScreenTitle -ArrayOfOptions $DisplayAdapters }
					else
					{ $SelectionOption = Show-Menu -MenuTitle $ScreenTitle -AdditionalInfo $LocalStrings.NoVNForIP }
					foreach ($Adapter in $TrackAdapters)
					{
						if($Adapter[0] -eq $SelectionOption)
						{ $SelectedAdapter = $Adapter[1] }
					}
					if($SelectedAdapter.Length -gt 0)
					{
						if($MenuOption -eq 5)
						{
							Prompt-ForIPInformation -AdapterName $SelectedAdapter
						}
						else
						{
							Clear-IPInfo -AdapterName $SelectedAdapter
						}
					}
				}
			}
			7 { # Set/clear virtual network adapter VLAN
				$SelectionOption = 99
				while($SelectionOption -ne 0)
				{
					$i = 0
					$DisplayAdapters = @()
					$TrackAdapters = @()
					Clear-Host
					Write-Host $LocalStrings.LoadingAdapters
					foreach ($Adapter in Get-VMNetworkAdapterVlan -ManagementOS)
					{
						$i += 1
						$DisplayAdapters += ($Adapter.ParentAdapter.Name + ": " + $Adapter.AccessVlanId)
						$TrackAdapters += , @($i, $Adapter.ParentAdapter.Name)
					}
					
					$SelectionOption = Show-Menu -MenuTitle $LocalStrings.AdapterListTitle -ArrayOfOptions $DisplayAdapters
					foreach ($AdapterItem in $TrackAdapters)
					{
						if($AdapterItem[0] -eq $SelectionOption)
						{
							Clear-Host
							$VLANID = Read-Host ($LocalStrings.EnterVLAN -f $AdapterItem[1])
							try
							{
								if($VLANID -eq -1)
								{ Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName $AdapterItem[1] -Untagged }
								else { Set-VMNetworkAdapterVlan -ManagementOS -VMNetworkAdapterName $AdapterItem[1] -Access -VlanId $VLANID }
							}
							catch
							{
								Write-Host $_
								Read-Host $LocalStrings.FailureFinish
							}
						}
					}
				}
			}
			8 { # Show switches and adapters
				$SwitchOut = New-Object System.Text.StringBuilder
				$AdapterData = @()
				$AdapterSeparator = ("-" * 20)
				$NetworkSeparator = ("=" * ($WindowWidth - 2))
				Clear-Host
				Write-Host $LocalStrings.LoadingSwitches
				Get-VMNetworkAdapterVlan | ForEach-Object -Process {
					if($_.OperationMode -eq "Untagged")
					{ $Vlan = $LocalStrings.Untagged }
					else
					{ $Vlan = $_.AccessVlanId }
					$AdapterData += ,@($_.ParentAdapter.Name, $_.ParentAdapter.SwitchName, $Vlan)
				}
				Get-VMSwitch | ForEach-Object -Process {
					if($_.Name -gt 0)
					{
						$SwitchOut.AppendLine($LocalStrings.VirtualSwitchName -f $_.Name) | Out-Null
						$SwitchOut.AppendLine($LocalStrings.VirtualSwitchType -f $_.SwitchType) | Out-Null
						if($_.SwitchType -eq "External")
						{
							$SwitchOut.AppendLine($LocalStrings.VirtualSwitchPhysical -f (Get-NetAdapter -InterfaceDescription $_.NetAdapterInterfaceDescription).Name) | Out-Null
							$SwitchOut.AppendLine($LocalStrings.VirtualSwitchReservationMode -f $_.BandwidthReservationMode) | Out-Null
							$SwitchOut.AppendLine($LocalStrings.VirtualSwitchIOVEnabled -f $_.IovEnabled) | Out-Null
						}
						$SwitchOut.AppendLine() | Out-Null
						$SwitchOut.AppendLine($LocalStrings.VirtualSwitchAdapters) | Out-Null
						foreach($Adapter in $AdapterData)
						{
							if($Adapter[1] -eq $_.Name)
							{
								$SwitchOut.AppendLine($AdapterSeparator) | Out-Null
								$SwitchOut.AppendLine($LocalStrings.ShowAdapterName -f $Adapter[0]) | Out-Null
								$SwitchOut.AppendLine($LocalStrings.ShowAdapterVLAN -f $Adapter[2]) | Out-Null
							}
						}
						$SwitchOut.AppendLine($NetworkSeparator) | Out-Null
					}
				}
				Clear-Host
				Write-Host $SwitchOut.ToString()
				Read-Host $LocalStrings.FailureFinish
			}
		}
	}
}

# main menu
function Display-MainMenu
{
	$AdditionalInfo = ""
	$Selections = @($LocalStrings.WorkWithTeams)
	if($VSwitchAvailable)
	{
		$Selections += $LocalStrings.WorkWithSwitches
	}
	else { $AdditionalInfo = $LocalStrings.NoSwitch }
	while ($MenuOption -ne 0)
	{
		$MenuOption = Show-Menu -MenuTitle $LocalStrings.MainMenuTitle -ArrayOfOptions $Selections -BackMenuText $LocalStrings.ExitScript -AdditionalInfo $AdditionalInfo
		switch ($MenuOption)
		{
			1 {
				Display-MainTeamMenu
			}
			2 {
				Display-MainSwitchesMenu
			}
		}
	}
}

# Main execution
Display-MainMenu
Clear-Host