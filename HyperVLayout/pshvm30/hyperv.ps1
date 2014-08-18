[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

#region mainForm Creation
#~~< HypervFORM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$HypervFORM = New-Object System.Windows.Forms.Form
$HypervFORM.ClientSize = New-Object System.Drawing.Size(800, 700)
$HypervFORM.ControlBox = $TRUE
$HypervFORM.Font = New-Object System.Drawing.Font("Tahoma", 8.25)
$HypervFORM.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$HypervFORM.MaximizeBox = $TRUE
$HypervFORM.MinimizeBox = $TRUE
$HypervFORM.ShowIcon = $FALSE
$HypervFORM.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$HypervFORM.Text = "PSHVM30 - Powershell Hyper-V Manager"
$HypervFORM.BackColor = [System.Drawing.Color]::White
$HypervFORM.KeyPreview = $True
$HypervFORM.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$HypervFORM.Close()}})
#~~< SplitContainer1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SplitContainer1 = New-Object System.Windows.Forms.SplitContainer
$SplitContainer1.Location = New-Object System.Drawing.Point(-1, 80)
$SplitContainer1.Size = New-Object System.Drawing.Size(800, 575)
$SplitContainer1.SplitterDistance = 200
$SplitContainer1.BackColor = [System.Drawing.Color]::LightGray
#~~< SplitContainer1.Panel1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Panel1 = New-Object System.Windows.Forms.Panel
$Panel1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel1.Dock = [System.Windows.Forms.DockStyle]::Fill
$Panel1.Location = New-Object System.Drawing.Point(0, 0)
$Panel1.Size = New-Object System.Drawing.Size(150, 724)

#~~< VHMGR >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VHMGR = New-Object System.Windows.Forms.Label
$VHMGR.Location = New-Object System.Drawing.Point(12, 18)
$VHMGR.Size = New-Object System.Drawing.Size(180, 18)
$VHMGR.Text = "Configure VHOST"
$VHMGR.Cursor = [System.Windows.Forms.Cursors]::Hand
$VHMGR.add_Click({VHMGRClick})
#~~< SSRDP >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SSRDP = New-Object System.Windows.Forms.Label
$SSRDP.Location = New-Object System.Drawing.Point(12, 58)
$SSRDP.Size = New-Object System.Drawing.Size(180, 18)
$SSRDP.Text = "Stop/Start/Connect to VM"
$SSRDP.Cursor = [System.Windows.Forms.Cursors]::Hand
$SSRDP.add_Click({SSRDPClick})
#~~< DVDMGR >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$DVDMGR = New-Object System.Windows.Forms.Label
$DVDMGR.Location = New-Object System.Drawing.Point(12, 98)
$DVDMGR.Size = New-Object System.Drawing.Size(180, 18)
$DVDMGR.Text = "Manage VM DVD/ISO"
$DVDMGR.Cursor = [System.Windows.Forms.Cursors]::Hand
$DVDMGR.add_Click({DVDMGRClick})
#~~< RenameVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RenameVM = New-Object System.Windows.Forms.Label
$RenameVM.Location = New-Object System.Drawing.Point(12, 138)
$RenameVM.Size = New-Object System.Drawing.Size(180, 18)
$RenameVM.Text = "Remove or Rename VM"
$RenameVM.Cursor = [System.Windows.Forms.Cursors]::Hand
$RenameVM.add_Click({RenameVMClick})
#~~< RemoveVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RAMvCPU = New-Object System.Windows.Forms.Label
$RAMvCPU.Location = New-Object System.Drawing.Point(12, 178)
$RAMvCPU.Size = New-Object System.Drawing.Size(180, 18)
$RAMvCPU.Text = "Edit VM - RAM/vCPU Count"
$RAMvCPU.Cursor = [System.Windows.Forms.Cursors]::Hand
$RAMvCPU.add_Click({RAMvCPUclick})
#~~< NewVMvhd >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NewVMvhd = New-Object System.Windows.Forms.Label
$NewVMvhd.Location = New-Object System.Drawing.Point(12, 218)
$NewVMvhd.Size = New-Object System.Drawing.Size(180, 18)
$NewVMvhd.Text = "New VM with New VHD"
$NewVMvhd.Cursor = [System.Windows.Forms.Cursors]::Hand
$NewVMvhd.add_Click({NewVMvhdClick})
#~~< NewVMeVHD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NewVMeVHD = New-Object System.Windows.Forms.Label
$NewVMeVHD.Location = New-Object System.Drawing.Point(12, 258)
$NewVMeVHD.Size = New-Object System.Drawing.Size(180, 18)
$NewVMeVHD.Text = "New VM with Existing VHD"
$NewVMeVHD.Cursor = [System.Windows.Forms.Cursors]::Hand
$NewVMeVHD.add_Click({NewVMeVHDClick})
#~~< NewVHD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NewVHD = New-Object System.Windows.Forms.Label
$NewVHD.Location = New-Object System.Drawing.Point(12, 298)
$NewVHD.Size = New-Object System.Drawing.Size(180, 18)
$NewVHD.Text = "Create/Attach new VHD to VM"
$NewVHD.Cursor = [System.Windows.Forms.Cursors]::Hand
$NewVHD.add_Click({NewVHDClick})
#~~< VHDexists >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VHDexists = New-Object System.Windows.Forms.Label
$VHDexists.Location = New-Object System.Drawing.Point(12, 338)
$VHDexists.Size = New-Object System.Drawing.Size(180, 18)
$VHDexists.Text = "Attach/Remove VHD - VM"
$VHDexists.Cursor = [System.Windows.Forms.Cursors]::Hand
$VHDexists.add_Click({VHDexistsClick})
#~~< ExportVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ExportVM = New-Object System.Windows.Forms.Label
$ExportVM.Location = New-Object System.Drawing.Point(12, 378)
$ExportVM.Size = New-Object System.Drawing.Size(180, 18)
$ExportVM.Text = "Export VM"
$ExportVM.Cursor = [System.Windows.Forms.Cursors]::Hand
$ExportVM.add_Click({ExportVMclick})
#~~< ImportVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ImportVM = New-Object System.Windows.Forms.Label
$ImportVM.Location = New-Object System.Drawing.Point(12, 418)
$ImportVM.Size = New-Object System.Drawing.Size(180, 18)
$ImportVM.Text = "Import VM"
$ImportVM.Cursor = [System.Windows.Forms.Cursors]::Hand
$ImportVM.add_Click({ImportVMclick})
#~~< NetworkVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NetworkVM = New-Object System.Windows.Forms.Label
$NetworkVM.Location = New-Object System.Drawing.Point(12, 458)
$NetworkVM.Size = New-Object System.Drawing.Size(180, 18)
$NetworkVM.Text = "VM Networking"
$NetworkVM.Cursor = [System.Windows.Forms.Cursors]::Hand
$NetworkVM.add_Click({NetworkVMclick})
#~~< Summary >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Summary = New-Object System.Windows.Forms.Label
$Summary.Location = New-Object System.Drawing.Point(12, 498)
$Summary.Size = New-Object System.Drawing.Size(180, 18)
$Summary.Text = "VHOST Summary"
$Summary.Cursor = [System.Windows.Forms.Cursors]::Hand
$Summary.add_Click({SummaryClick})

#~~ < Add above elements >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SplitContainer1.Panel1.Controls.Add($VHMGR)
$SplitContainer1.Panel1.Controls.Add($SSRDP)
$SplitContainer1.Panel1.Controls.Add($DVDMGR)
$SplitContainer1.Panel1.Controls.Add($RenameVM)
$SplitContainer1.Panel1.Controls.Add($RAMvCPU)
$SplitContainer1.Panel1.Controls.Add($NewVMvhd)
$SplitContainer1.Panel1.Controls.Add($NewVMeVHD)
$SplitContainer1.Panel1.Controls.Add($NewVHD)
$SplitContainer1.Panel1.Controls.Add($VHDexists)
$SplitContainer1.Panel1.Controls.Add($ExportVM)
$SplitContainer1.Panel1.Controls.Add($ImportVM)
$SplitContainer1.Panel1.Controls.Add($NetworkVM)
$SplitContainer1.Panel1.Controls.Add($Summary)
$SplitContainer1.Panel1.Controls.Add($Panel1)



#~~< SplitContainer1.Panel2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Panel2 = New-Object System.Windows.Forms.Panel
$Panel2.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel2.Dock = [System.Windows.Forms.DockStyle]::Fill
$Panel2.Location = New-Object System.Drawing.Point(0, 0)
$Panel2.Size = New-Object System.Drawing.Size(150, 724)
$Panel2.BackColor = [System.Drawing.Color]::Gainsboro

#(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
$frmINFO = New-Object System.Windows.Forms.Panel
$frmINFO.Location = New-Object System.Drawing.Point(17, 3)
$frmINFO.ClientSize = New-Object System.Drawing.Size(555, 548)
$frmINFO.BackColor = [System.Drawing.Color]::LightGray

############################################## Start text fields
$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(10,10) 
$outputBox.Size = New-Object System.Drawing.Size(535,528) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical" 
$frmINFO.Controls.Add($outputBox) 
############################################## end text fields
#(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((

#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
$frmNetworkVM = New-Object System.Windows.Forms.Panel
$frmNetworkVM.Location = New-Object System.Drawing.Point(17, 10)
$frmNetworkVM.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmNetworkVM.BackColor = [System.Drawing.Color]::LightGray

#~~< GroupBoxVMnw >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxVMnw = New-Object System.Windows.Forms.GroupBox
$GroupBoxVMnw.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxVMnw.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxVMnw.Location = New-Object System.Drawing.Point(20, 55)
$GroupBoxVMnw.Size = New-Object System.Drawing.Size(500, 180)
#~~< listViewVMnw >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewVMnw = New-Object System.Windows.Forms.ListView
$listViewVMnw.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewVMnw.View = 'Details'
$listViewVMnw.FullRowSelect = $True 
$listViewVMnw.HideSelection = $False
$listViewVMnw.Location = New-Object System.Drawing.Size(10,15) 
$listViewVMnw.Width = 475
$listViewVMnw.Height = 155
$listViewVMnw.Columns.Add('VMName',235)
$listViewVMnw.Columns.Add('vSwitch Name',110)
$listViewVMnw.Columns.Add('NIC Name',110)

$GroupBoxVMnw.Controls.Add($listViewVMnw)
$GroupBoxVMnw.ForeColor = [System.Drawing.Color]::Black
$frmNetworkVM.Controls.Add($GroupBoxVMnw)

#~~< VMnwText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VMnwText = New-Object System.Windows.Forms.Label
$VMnwText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$VMnwText.Location = New-Object System.Drawing.Point(20, 30)
$VMnwText.Size = New-Object System.Drawing.Size(442, 23)
$VMnwText.Text = "Move vSwitch, Plug/Unplugg into/from vSwitch, Add or Remove VM NIC."
$frmNetworkVM.Controls.Add($VMnwText)

#~~< VMnwTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VMnwTitle = New-Object System.Windows.Forms.Label
$VMnwTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$VMnwTitle.Location = New-Object System.Drawing.Point(20, 13)
$VMnwTitle.Size = New-Object System.Drawing.Size(500, 17)
$VMnwTitle.Text = "Virtual Machine Network Actions"
$frmNetworkVM.Controls.Add($VMnwTitle)

$ResetButton6 = New-Object System.Windows.Forms.Button
$ResetButton6.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ResetButton6.Location = New-Object System.Drawing.Size(405,515)
$ResetButton6.Size = New-Object System.Drawing.Size(125,23)
$ResetButton6.Text = "Reset Form"
$ResetButton6.Add_Click({clearform7nw})
$frmNetworkVM.Controls.Add($ResetButton6) 

$VMnwLabel2 = New-object System.Windows.Forms.Label
$VMnwLabel2.Location = New-object System.Drawing.Size(20,240)
$VMnwLabel2.Size = New-object System.Drawing.Size(500,20)
$VMnwLabel2.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel2.Text = "Action - Move vSwitch or Plug into a vSwitch (DOES NOT stop VM)"
$frmNetworkVM.Controls.Add($VMnwLabel2) 

#vswitch choice
$VMnwLabel4 = New-object System.Windows.Forms.Label
$VMnwLabel4.Location = New-object System.Drawing.Size(155,265)
$VMnwLabel4.Size = New-object System.Drawing.Size(210,20)  
$VMnwLabel4.Text = "vSwitch to Move or Attach VM to?"
$frmNetworkVM.Controls.Add($VMnwLabel4) 
$VMnwDropDownBox1 = New-object System.Windows.Forms.ComboBox
$VMnwDropDownBox1.Location = New-object System.Drawing.Size(20,265) 
$VMnwDropDownBox1.Size = New-object System.Drawing.Size(125,20) 
$VMnwDropDownBox1.DropDownHeight = 75
$VMnwDropDownBox1.Add_Click({load2})
function load2 {
$VMnwDropDownBox1.items.clear()
$vswitch2 = get-vmswitch
$vswitch2 | ForEach-Object {$VMnwDropDownBox1.Items.Add($_.Name)}}
$frmNetworkVM.Controls.Add($VMnwDropDownBox1) 

$OKButton12 = New-Object System.Windows.Forms.Button
$OKButton12.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton12.Location = New-Object System.Drawing.Size(380,265)
$OKButton12.Size = New-Object System.Drawing.Size(145,23)
$OKButton12.Text = "Move/Attach vSwitch"
$OKButton12.Add_Click({MoveAddvswitch})
$frmNetworkVM.Controls.Add($OKButton12) 

$VMnwLabel3a = New-object System.Windows.Forms.Label
$VMnwLabel3a.Location = New-object System.Drawing.Size(20,285)
$VMnwLabel3a.Size = New-object System.Drawing.Size(400,20)
$VMnwLabel3a.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel3a.Text = 

"_________________________________________________________________________________________________________________________________________"
$frmNetworkVM.Controls.Add($VMnwLabel3a) 

$VMnwLabel3 = New-object System.Windows.Forms.Label
$VMnwLabel3.Location = New-object System.Drawing.Size(20,305)
$VMnwLabel3.Size = New-object System.Drawing.Size(500,20)
$VMnwLabel3.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel3.Text = "Action - Unplug VM from vSwitch (DOES NOT stop VM)"
$frmNetworkVM.Controls.Add($VMnwLabel3) 

$OKButton13 = New-Object System.Windows.Forms.Button
$OKButton13.FlatStyle = [System.Windows.Forms.FlatStyle]::System 
$OKButton13.Location = New-Object System.Drawing.Size(20,335)
$OKButton13.Size = New-Object System.Drawing.Size(245,23)
$OKButton13.Text = "Unplug above chosen VM from vSwitch"
$OKButton13.Add_Click({Unplugvswitch})
$frmNetworkVM.Controls.Add($OKButton13) 

$VMnwLabel41 = New-object System.Windows.Forms.Label
$VMnwLabel41.Location = New-object System.Drawing.Size(20,355)
$VMnwLabel41.Size = New-object System.Drawing.Size(400,20)
$VMnwLabel41.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel41.Text = 

"_________________________________________________________________________________________________________________________________________"
$frmNetworkVM.Controls.Add($VMnwLabel41) 

$VMnwLabel5 = New-object System.Windows.Forms.Label
$VMnwLabel5.Location = New-object System.Drawing.Size(20,375)
$VMnwLabel5.Size = New-object System.Drawing.Size(500,20)
$VMnwLabel5.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel5.Text = "Action - Add new NIC and attach to a vSwitch (* STOPS VM *)"
$frmNetworkVM.Controls.Add($VMnwLabel5) 

$NEWnicLabel = New-object System.Windows.Forms.Label
$NEWnicLabel.Location = New-object System.Drawing.Size(140,400) 
$NEWnicLabel.Text = "New NIC Name?"
$frmNetworkVM.Controls.Add($NEWnicLabel) 
$NEWnicTextBox = New-object System.Windows.Forms.TextBox 
$NEWnicTextBox.Location = New-object System.Drawing.Size(20,400) 
$NEWnicTextBox.Size = New-object System.Drawing.Size(110,20) 
$frmNetworkVM.Controls.Add($NEWnicTextBox) 

#vswitch choice
$VMnwLabel6 = New-object System.Windows.Forms.Label
$VMnwLabel6.Location = New-object System.Drawing.Size(385,400)
$VMnwLabel6.Size = New-object System.Drawing.Size(210,20)  
$VMnwLabel6.Text = "vSwitch to Attach NIC to?"
$frmNetworkVM.Controls.Add($VMnwLabel6) 
$VMnwDropDownBox2 = New-object System.Windows.Forms.ComboBox
$VMnwDropDownBox2.Location = New-object System.Drawing.Size(250,400) 
$VMnwDropDownBox2.Size = New-object System.Drawing.Size(125,20) 
$VMnwDropDownBox2.DropDownHeight = 75
$VMnwDropDownBox2.Add_Click({load3})
function load3 {
$VMnwDropDownBox2.items.clear() 
$vswitch3 = get-vmswitch
$vswitch3 | ForEach-Object {$VMnwDropDownBox2.Items.Add($_.Name)}}
$frmNetworkVM.Controls.Add($VMnwDropDownBox2) 

$OKButton15 = New-Object System.Windows.Forms.Button
$OKButton15.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton15.Location = New-Object System.Drawing.Size(20,435)
$OKButton15.Size = New-Object System.Drawing.Size(245,23)
$OKButton15.Text = "Add new NIC and attach to vSwitch chosen"
$OKButton15.Add_Click({AddnicNEW})
$frmNetworkVM.Controls.Add($OKButton15) 

$VMnwLabel45 = New-object System.Windows.Forms.Label
$VMnwLabel45.Location = New-object System.Drawing.Size(20,455)
$VMnwLabel45.Size = New-object System.Drawing.Size(400,20)
$VMnwLabel45.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel45.Text = 

"_________________________________________________________________________________________________________________________________________"
$frmNetworkVM.Controls.Add($VMnwLabel45) 

$VMnwLabel7 = New-object System.Windows.Forms.Label
$VMnwLabel7.Location = New-object System.Drawing.Size(20,475)
$VMnwLabel7.Size = New-object System.Drawing.Size(500,20)
$VMnwLabel7.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$VMnwLabel7.Text = "Action - Remove NIC from VM (* STOPS VM *)"
$frmNetworkVM.Controls.Add($VMnwLabel7) 

$OKButton23 = New-Object System.Windows.Forms.Button
$OKButton23.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton23.Location = New-Object System.Drawing.Size(20,505)
$OKButton23.Size = New-Object System.Drawing.Size(245,23)
$OKButton23.Text = "Remove NIC from VM"
$OKButton23.Add_Click({RemoveNICvm})
$frmNetworkVM.Controls.Add($OKButton23) 

#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
# Import VM Form
$frmImportVM = New-Object System.Windows.Forms.Panel
$frmImportVM.Location = New-Object System.Drawing.Point(17, 10)
$frmImportVM.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmImportVM.BackColor = [System.Drawing.Color]::LightGray

#~~< lblImportText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblImportText = New-Object System.Windows.Forms.Label
$lblImportText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblImportText.Location = New-Object System.Drawing.Point(20, 50)
$lblImportText.Size = New-Object System.Drawing.Size(442,50)
$lblImportText.Text = "Imports the virtual machine by copying its files to the default virtual machine and virtual hard drive storage locations of the Hyper-V host"
$frmImportVM.Controls.Add($lblImportText)

#~~< lblImportTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblImportTitle = New-Object System.Windows.Forms.Label
$lblImportTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblImportTitle.Location = New-Object System.Drawing.Point(20,25)
$lblImportTitle.Size = New-Object System.Drawing.Size(346, 20)
$lblImportTitle.Text = "Import Virtual Machine"
$frmImportVM.Controls.Add($lblImportTitle)


#~~< Importlbl1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Importlbl1 = New-Object System.Windows.Forms.Label
$Importlbl1.Location = New-Object System.Drawing.Point(20, 100)
$Importlbl1.Size = New-Object System.Drawing.Size(495, 40)
$Importlbl1.Text = "** You must have exported a VM before you can import one. Be patient this may take a while if your VHDx file is fixed and 

rather large. There is no Progress bar for this process. Your VM will be left powered off when done **"
$frmImportVM.Controls.Add($Importlbl1)

#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActionsIM = New-Object System.Windows.Forms.Label
$lblActionsIM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActionsIM.Location = New-Object System.Drawing.Point(40, 150)
$lblActionsIM.Size = New-Object System.Drawing.Size(400, 20)
$lblActionsIM.Text = "Import Actions -  All fields must be filled or process will fail."
$frmImportVM.Controls.Add($lblActionsIM)

#~~< Importlbl2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Importlbl2 = New-Object System.Windows.Forms.Label
$Importlbl2.Location = New-Object System.Drawing.Point(20, 180)
$Importlbl2.Size = New-Object System.Drawing.Size(495, 30)
$Importlbl2.Text = "Path to the Export Folder and XML file (ex: C:\Export\test1\Virtual machines\8F148B6D-C674-413E-9FCC-4FBED185C52D.XML)"
$frmImportVM.Controls.Add($Importlbl2)

$ImportTextbox1 = New-Object System.Windows.Forms.TextBox 
$ImportTextbox1.Location = New-Object System.Drawing.Size(20,210) 
$ImportTextbox1.Size = New-Object System.Drawing.Size(200,170)
$frmImportVM.Controls.Add($ImportTextbox1) 
$ImportBrowseBtn1 = New-Object System.Windows.Forms.Button
$ImportBrowseBtn1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ImportBrowseBtn1.Location = New-Object System.Drawing.Size(230,210)
$ImportBrowseBtn1.Size = New-Object System.Drawing.Size(250,23)
$ImportBrowseBtn1.Text = "Browse to Virtual Machine File..."
$ImportBrowseBtn1.Add_Click({
$ImportPATH4 = PromptFor-File -InitialDirectory C:\ -Type open
	If($ImportPATH4) { 
        [system.windows.forms.messagebox]::show($ImportPATH4)
        $ImportTextbox1.Text = $ImportPATH4
        }
     })
$frmImportVM.Controls.Add($ImportBrowseBtn1)

#~~< Importlbl3 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Importlbl3 = New-Object System.Windows.Forms.Label
$Importlbl3.Location = New-Object System.Drawing.Point(20, 240)
$Importlbl3.Size = New-Object System.Drawing.Size(495, 30)
$Importlbl3.Text = "Path to the Import Folder(ex: C:\Virtualservers\test2) You will need to manually create the test2 folder"
$frmImportVM.Controls.Add($Importlbl3)

$ImportTextbox2 = New-Object System.Windows.Forms.TextBox 
$ImportTextbox2.Location = New-Object System.Drawing.Size(20,270) 
$ImportTextbox2.Size = New-Object System.Drawing.Size(200,170)
$frmImportVM.Controls.Add($ImportTextbox2) 
$ImportBrowseBtn2 = New-Object System.Windows.Forms.Button
$ImportBrowseBtn2.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ImportBrowseBtn2.Location = New-Object System.Drawing.Size(230,270)
$ImportBrowseBtn2.Size = New-Object System.Drawing.Size(250,23)
$ImportBrowseBtn2.Text = "Browse to Import Folder..."
$ImportBrowseBtn2.Add_Click({
$ImportPATH3 = $Browser.SelectFolder("Choose your Import Folder Path - Cancel = No change", "C:\", [IntPtr]::Zero)
    	If($ImportPATH3) { 
        [system.windows.forms.messagebox]::show($ImportPATH3)
        $ImportTextbox2.Text = $ImportPATH3}
     })
$frmImportVM.Controls.Add($ImportBrowseBtn2)

$IMPORTLabel3 = New-object System.Windows.Forms.Label
$IMPORTLabel3.Location = New-object System.Drawing.Size(20,300)
$IMPORTLabel3.Size = New-object System.Drawing.Size(400,40)  
$IMPORTLabel3.Text = "Imported VM with same VMID (old VM needs to be deleted first) or Import VM with a new VMID (aka an exact copy with new 

VMID)"
$frmImportVM.Controls.Add($IMPORTLabel3) 
$RadioButton1i = New-Object System.Windows.Forms.RadioButton 
$RadioButton1i.Location = new-object System.Drawing.Point(30,340) 
$RadioButton1i.size = New-Object System.Drawing.Size(400,20) 
$RadioButton1i.Text = "Same VMID and VMName = Exact restore of original" 
$frmImportVM.Controls.Add($RadioButton1i) 

$RadioButton2i = New-Object System.Windows.Forms.RadioButton
$RadioButton2i.Location = new-object System.Drawing.Point(30,360)
$RadioButton2i.size = New-Object System.Drawing.Size(500,20)
$RadioButton2i.Text = "New VMID and New VMName... a popup of instructions will load when this is checked."
$RadioButton2i.Add_Click({if ($RadioButton2i.Checked -eq $true){
notepad.exe $ImportTextbox1.Text
$ReadmePath = Join-Path (Get-ScriptDirectory) "import_readme.txt"
notepad.exe $ReadmePath
}})
$frmImportVM.Controls.Add($RadioButton2i) 

#~~< btnImportOK >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnImportOK = New-Object System.Windows.Forms.Button
$btnImportOK.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnImportOK.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnImportOK.Location = New-Object System.Drawing.Point(20, 400)
$btnImportOK.Size = New-Object System.Drawing.Size(98, 26)
$btnImportOK.Text = "Import VM"
$btnImportOK.add_Click({ImportVM})
$frmImportVM.Controls.Add($btnImportOK)
#ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
## Export form
$frmExportVM = New-Object System.Windows.Forms.Panel
$frmExportVM.Location = New-Object System.Drawing.Point(17, 10)
$frmExportVM.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmExportVM.BackColor = [System.Drawing.Color]::LightGray

#~~< lblEXPORTText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblEXPORTText = New-Object System.Windows.Forms.Label
$lblEXPORTText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblEXPORTText.Location = New-Object System.Drawing.Point(20, 50)
$lblEXPORTText.Size = New-Object System.Drawing.Size(442, 23)
$lblEXPORTText.Text = "NOTE: THE VM WILL BE POWERED OFF DURING THE EXPORT PROCESS"
$frmExportVM.Controls.Add($lblEXPORTText)

#~~< lblEXPORTTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblEXPORTTitle = New-Object System.Windows.Forms.Label
$lblEXPORTTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblEXPORTTitle.Location = New-Object System.Drawing.Point(20, 33)
$lblEXPORTTitle.Size = New-Object System.Drawing.Size(346, 20)
$lblEXPORTTitle.Text = "Export Virtual Machine"
$frmExportVM.Controls.Add($lblEXPORTTitle)
#~~< ExportGroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ExportGroupBox1 = New-Object System.Windows.Forms.GroupBox
$ExportGroupBox1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$ExportGroupBox1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$ExportGroupBox1.Location = New-Object System.Drawing.Point(15, 85)
$ExportGroupBox1.Size = New-Object System.Drawing.Size(500, 225)
$ExportGroupBox1.Text = "Select the VM to Export"
#~~< listViewExport >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewExport = New-Object System.Windows.Forms.ListView
$listViewExport.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewExport.View = 'Details'
$listViewExport.HideSelection = $False
$listViewExport.Location = New-Object System.Drawing.Size(10,15) 
$listViewExport.Width = 475
$listViewExport.Height = 200
$listViewExport.Columns.Add('VMName',340)
$listViewExport.Columns.Add('State',100)

$ExportGroupBox1.Controls.Add($listViewExport)
$frmExportVM.Controls.Add($ExportGroupBox1)

#~~< lbl1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lbl1 = New-Object System.Windows.Forms.Label
$lbl1.Location = New-Object System.Drawing.Point(20, 330)
$lbl1.Size = New-Object System.Drawing.Size(495, 30)
$lbl1.Text = "Be patient this may take a while if your VHDx file is fixed and rather large. There is no Progress bar for this process. Your VM 

will be re-started when done"
$frmExportVM.Controls.Add($lbl1)

#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActionsex = New-Object System.Windows.Forms.Label
$lblActionsex.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActionsex.Location = New-Object System.Drawing.Point(40, 370)
$lblActionsex.Size = New-Object System.Drawing.Size(172, 20)
$lblActionsex.Text = "Export Actions"
$frmExportVM.Controls.Add($lblActionsex)

#~~< lbl2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lbl2 = New-Object System.Windows.Forms.Label
$lbl2.Location = New-Object System.Drawing.Point(20, 400)
$lbl2.Size = New-Object System.Drawing.Size(495, 30)
$lbl2.Text = "Select Export folder (ex:C:\export) the process will create a folder with the name of the VM to put the exported files in."
$frmExportVM.Controls.Add($lbl2)

$ExportTextbox1 = New-Object System.Windows.Forms.TextBox 
$ExportTextbox1.Location = New-Object System.Drawing.Size(20,440) 
$ExportTextbox1.Size = New-Object System.Drawing.Size(200,170)
$frmExportVM.Controls.Add($ExportTextbox1) 
$ExportBrowseBtn1 = New-Object System.Windows.Forms.Button
$ExportBrowseBtn1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ExportBrowseBtn1.Location = New-Object System.Drawing.Size(230,440)
$ExportBrowseBtn1.Size = New-Object System.Drawing.Size(250,23)
$ExportBrowseBtn1.Text = "Browse to Export Path..."
$ExportBrowseBtn1.Add_Click({
     $EXportPATH4 = $Browser.SelectFolder("Choose your Export Folder Path - Cancel = No change", "C:\", [IntPtr]::Zero)
	If($EXportPATH4) { 
        [system.windows.forms.messagebox]::show($EXportPATH4)
        $ExportTextbox1.Text = $EXportPATH4}
     })
$frmExportVM.Controls.Add($ExportBrowseBtn1)

#~~< btnExportOK >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnExportOK = New-Object System.Windows.Forms.Button
$btnExportOK.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnExportOK.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnExportOK.Location = New-Object System.Drawing.Point(20, 510)
$btnExportOK.Size = New-Object System.Drawing.Size(98, 26)
$btnExportOK.Text = "Export VM"
$btnExportOK.add_Click({ExportVM1})
$frmExportVM.Controls.Add($btnExportOK)
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

#KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
$frmExistVHD = New-Object System.Windows.Forms.Panel
$frmExistVHD.Location = New-Object System.Drawing.Point(17, 10)
$frmExistVHD.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmExistVHD.BackColor = [System.Drawing.Color]::LightGray

#~~< GroupBoxExistVHD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxExistVHD = New-Object System.Windows.Forms.GroupBox
$GroupBoxExistVHD.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxExistVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxExistVHD.Location = New-Object System.Drawing.Point(20, 55)
$GroupBoxExistVHD.Size = New-Object System.Drawing.Size(500, 190)
$GroupBoxExistVHD.Text = "Virtual Machine List"
#~~< listViewExistVHD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewExistVHD = New-Object System.Windows.Forms.ListView
$listViewExistVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewExistVHD.View = 'Details'
$listViewExistVHD.FullRowSelect = $True 
$listViewExistVHD.HideSelection = $False
$listViewExistVHD.Location = New-Object System.Drawing.Size(10,15) 
$listViewExistVHD.Width = 475
$listViewExistVHD.Height = 155
$listViewExistVHD.Columns.Add('VMName',175)
$listViewExistVHD.Columns.Add('CT',40)
$listViewExistVHD.Columns.Add('CN',40)
$listViewExistVHD.Columns.Add('CL',40)
$listViewExistVHD.Columns.Add('Path',225)

$GroupBoxExistVHD.Controls.Add($listViewExistVHD)
$GroupBoxExistVHD.ForeColor = [System.Drawing.Color]::Black
$frmExistVHD.Controls.Add($GroupBoxExistVHD)

#~~< ExistVHDText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ExistVHDText = New-Object System.Windows.Forms.Label
$ExistVHDText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$ExistVHDText.Location = New-Object System.Drawing.Point(20, 30)
$ExistVHDText.Size = New-Object System.Drawing.Size(442, 23)
$ExistVHDText.Text = "This will stop the chosen VM and then perform the chosen Action."
$frmExistVHD.Controls.Add($ExistVHDText)

#~~< ExistVHDTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ExistVHDTitle = New-Object System.Windows.Forms.Label
$ExistVHDTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$ExistVHDTitle.Location = New-Object System.Drawing.Point(20, 13)
$ExistVHDTitle.Size = New-Object System.Drawing.Size(500, 17)
$ExistVHDTitle.Text = "Add or Remove an Existing Virtual Disk Drive, to or from a Virtual Machine"
$frmExistVHD.Controls.Add($ExistVHDTitle)

$ExistVHDLabel2 = New-object System.Windows.Forms.Label
$ExistVHDLabel2.Location = New-object System.Drawing.Size(20,250)
$ExistVHDLabel2.Size = New-object System.Drawing.Size(400,20)
$ExistVHDLabel2.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$ExistVHDLabel2.Text = "Add Existing VHDx to a VM - Actions: (Choose VMName Only)"
$frmExistVHD.Controls.Add($ExistVHDLabel2) 

$RadioButton11 = New-Object System.Windows.Forms.RadioButton 
$RadioButton11.Location = new-object System.Drawing.Point(30,270) 
$RadioButton11.size = New-Object System.Drawing.Size(200,20) 
$RadioButton11.Text = "Add and Existing VHDx File to a VM" 
$frmExistVHD.Controls.Add($RadioButton11) 

$ExistVHDTextbox1 = New-Object System.Windows.Forms.TextBox 
$ExistVHDTextbox1.Location = New-Object System.Drawing.Size(20,300) 
$ExistVHDTextbox1.Size = New-Object System.Drawing.Size(200,170)
$frmExistVHD.Controls.Add($ExistVHDTextbox1) 
$ExistVHDBrowseBtn1 = New-Object System.Windows.Forms.Button
$ExistVHDBrowseBtn1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ExistVHDBrowseBtn1.Location = New-Object System.Drawing.Size(230,300)
$ExistVHDBrowseBtn1.Size = New-Object System.Drawing.Size(250,23)
$ExistVHDBrowseBtn1.Text = "Browse to Existing VHDx File..."
$ExistVHDBrowseBtn1.Add_Click({
     $VMPATH5 = PromptFor-File -InitialDirectory C:\ -Type open
	If($VMPATH5) { 
        [system.windows.forms.messagebox]::show($VMPATH5)
        $ExistVHDTextbox1.Text = $VMPATH5}
     })
$frmExistVHD.Controls.Add($ExistVHDBrowseBtn1)

#Start VM or leave off
$ExistVHDLabel1 = New-Object System.Windows.Forms.Label
$ExistVHDLabel1.Location = New-Object System.Drawing.Size(130,330)
$ExistVHDLabel1.Size = New-Object System.Drawing.Size(200,20)  
$ExistVHDLabel1.Text = "Start VM or Leave it Off?"
$frmExistVHD.Controls.Add($ExistVHDLabel1) 
$ExistVHDDropDownBox1 = New-Object System.Windows.Forms.ComboBox
$ExistVHDDropDownBox1.Location = New-Object System.Drawing.Size(20,330) 
$ExistVHDDropDownBox1.Size = New-Object System.Drawing.Size(100,20) 
$ExistVHDDropDownBox1.DropDownHeight = 200 
$wksList=@("Start VM","Leave OFF")
foreach ($wks in $wksList) {$ExistVHDDropDownBox1.Items.Add($wks)}
$frmExistVHD.Controls.Add($ExistVHDDropDownBox1) 

$OKButton12 = New-Object System.Windows.Forms.Button
$OKButton12.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton12.Location = New-Object System.Drawing.Size(355,335)
$OKButton12.Size = New-Object System.Drawing.Size(125,23)
$OKButton12.Text = "Add VHD"
$OKButton12.Add_Click({ADDeVHDvm})
$frmExistVHD.Controls.Add($OKButton12) 

$ExistVHDLabel3 = New-object System.Windows.Forms.Label
$ExistVHDLabel3.Location = New-object System.Drawing.Size(20,360)
$ExistVHDLabel3.Size = New-object System.Drawing.Size(400,20)
$ExistVHDLabel3.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$ExistVHDLabel3.Text = 

"_________________________________________________________________________________________________________________________________________"
$frmExistVHD.Controls.Add($ExistVHDLabel3) 

$ExistVHDLabel4 = New-object System.Windows.Forms.Label
$ExistVHDLabel4.Location = New-object System.Drawing.Size(20,380)
$ExistVHDLabel4.Size = New-object System.Drawing.Size(500,20)
$ExistVHDLabel4.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))  
$ExistVHDLabel4.Text = "Remove Existing VHDx from a VM - Actions: (Choose Entire Row for VMName)"
$frmExistVHD.Controls.Add($ExistVHDLabel4) 

$RadioButton22 = New-Object System.Windows.Forms.RadioButton
$RadioButton22.Location = new-object System.Drawing.Point(30,400)
$RadioButton22.size = New-Object System.Drawing.Size(200,20)
$RadioButton22.Text = "Remove a VHDx from a VM"
$frmExistVHD.Controls.Add($RadioButton22) 

#Save or Delete
$ExistVHDLabel6 = New-Object System.Windows.Forms.Label
$ExistVHDLabel6.Location = New-Object System.Drawing.Size(130,430)
$ExistVHDLabel6.Size = New-Object System.Drawing.Size(300,20)  
$ExistVHDLabel6.Text = "Save VHDx File  or Delete VHDx File?"
$frmExistVHD.Controls.Add($ExistVHDLabel6) 
$ExistVHDDropDownBox6 = New-Object System.Windows.Forms.ComboBox
$ExistVHDDropDownBox6.Location = New-Object System.Drawing.Size(20,430) 
$ExistVHDDropDownBox6.Size = New-Object System.Drawing.Size(100,20) 
$ExistVHDDropDownBox6.DropDownHeight = 200 
$wksList=@("Save","Delete")
foreach ($wks in $wksList) {$ExistVHDDropDownBox6.Items.Add($wks)}
$frmExistVHD.Controls.Add($ExistVHDDropDownBox6) 

#Start VM or leave off
$ExistVHDLabel5 = New-Object System.Windows.Forms.Label
$ExistVHDLabel5.Location = New-Object System.Drawing.Size(130,470)
$ExistVHDLabel5.Size = New-Object System.Drawing.Size(300,20)  
$ExistVHDLabel5.Text = "Start VM or Leave it Off?"
$frmExistVHD.Controls.Add($ExistVHDLabel5) 
$ExistVHDDropDownBox5 = New-Object System.Windows.Forms.ComboBox
$ExistVHDDropDownBox5.Location = New-Object System.Drawing.Size(20,470) 
$ExistVHDDropDownBox5.Size = New-Object System.Drawing.Size(100,20) 
$ExistVHDDropDownBox5.DropDownHeight = 200 
$wksList=@("Start VM","Leave OFF")
foreach ($wks in $wksList) {$ExistVHDDropDownBox5.Items.Add($wks)}
$frmExistVHD.Controls.Add($ExistVHDDropDownBox5) 

$OKButton6 = New-Object System.Windows.Forms.Button
$OKButton6.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton6.Location = New-Object System.Drawing.Size(20,510)
$OKButton6.Size = New-Object System.Drawing.Size(125,23)
$OKButton6.Text = "Remove VHD"
$OKButton6.Add_Click({RemoveVMvm})
$frmExistVHD.Controls.Add($OKButton6) 

$ResetButton6 = New-Object System.Windows.Forms.Button
$ResetButton6.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ResetButton6.Location = New-Object System.Drawing.Size(355,510)
$ResetButton6.Size = New-Object System.Drawing.Size(125,23)
$ResetButton6.Text = "Reset Form"
$ResetButton6.Add_Click({clearform7})
$frmExistVHD.Controls.Add($ResetButton6) 
#KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK

#RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR
#Form Creation
#~~< frmNEWVHDx >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmNEWVHDx = New-Object System.Windows.Forms.Panel
$frmNEWVHDx.Location = New-Object System.Drawing.Point(17, 10)
$frmNEWVHDx.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmNEWVHDx.BackColor = [System.Drawing.Color]::LightGray
#~~< GroupBoxNEWVHDx >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxNEWVHDx = New-Object System.Windows.Forms.GroupBox
$GroupBoxNEWVHDx.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxNEWVHDx.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxNEWVHDx.Location = New-Object System.Drawing.Point(20, 55)
$GroupBoxNEWVHDx.Size = New-Object System.Drawing.Size(500, 235)
$GroupBoxNEWVHDx.Text = "Virtual Machine List"
#~~< listViewNEWVHD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewNEWVHD = New-Object System.Windows.Forms.ListView
$listViewNEWVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewNEWVHD.View = 'Details'
$listViewNEWVHD.HideSelection = $False
$listViewNEWVHD.Location = New-Object System.Drawing.Size(10,15) 
$listViewNEWVHD.Width = 475
$listViewNEWVHD.Height = 155
$listViewNEWVHD.Columns.Add('VMName',220)
$listViewNEWVHD.Columns.Add('VHDX Path',220)

$GroupBoxNEWVHDx.Controls.Add($listViewNEWVHD)
$GroupBoxNEWVHDx.ForeColor = [System.Drawing.Color]::Black
$frmNEWVHDx.Controls.Add($GroupBoxNEWVHDx)

#~~< NEWVHDxText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NEWVHDxText = New-Object System.Windows.Forms.Label
$NEWVHDxText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$NEWVHDxText.Location = New-Object System.Drawing.Point(20, 30)
$NEWVHDxText.Size = New-Object System.Drawing.Size(442, 23)
$NEWVHDxText.Text = "This will stop the choosen VM and then ask if you want to Restart of Leave Off."
$frmNEWVHDx.Controls.Add($NEWVHDxText)

#~~< NEWVHDxTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$NEWVHDxTitle = New-Object System.Windows.Forms.Label
$NEWVHDxTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$NEWVHDxTitle.Location = New-Object System.Drawing.Point(20, 13)
$NEWVHDxTitle.Size = New-Object System.Drawing.Size(346, 17)
$NEWVHDxTitle.Text = "Create and Add New Virtual Disk Drive to a Virtual Machine"
$frmNEWVHDx.Controls.Add($NEWVHDxTitle)

$NEWVHDxLabel2 = New-object System.Windows.Forms.Label
$NEWVHDxLabel2.Location = New-object System.Drawing.Size(110,300)
$NEWVHDxLabel2.Size = New-Object System.Drawing.Size(300,20) 
$NEWVHDxLabel2.Text = "VHDx File Name (ex. DATA.VHDX):"
$frmNEWVHDx.Controls.Add($NEWVHDxLabel2) 
$NEWVHDxTextBox2 = New-object System.Windows.Forms.TextBox 
$NEWVHDxTextBox2.Location = New-object System.Drawing.Size(20,300) 
$NEWVHDxTextBox2.Size = New-object System.Drawing.Size(80,80) 
$frmNEWVHDx.Controls.Add($NEWVHDxTextBox2) 

$NEWVHDxLabel3 = New-object System.Windows.Forms.Label
$NEWVHDxLabel3.Location = New-object System.Drawing.Size(110,330)
$NEWVHDxLabel3.Size = New-Object System.Drawing.Size(500,20) 
$NEWVHDxLabel3.Text = "Virtual disk Size (GB):*"
$frmNEWVHDx.Controls.Add($NEWVHDxLabel3) 
$NEWVHDxTextBox3 = New-object System.Windows.Forms.TextBox 
$NEWVHDxTextBox3.Location = New-object System.Drawing.Size(20,330) 
$NEWVHDxTextBox3.Size = New-object System.Drawing.Size(80,80)
$frmNEWVHDx.Controls.Add($NEWVHDxTextBox3)

$NEWVHDxLabel4 = New-object System.Windows.Forms.Label
$NEWVHDxLabel4.Location = New-object System.Drawing.Size(130,360)
$NEWVHDxLabel4.Size = New-object System.Drawing.Size(300,20)  
$NEWVHDxLabel4.Text = "Type VHDx?* - Fixed = Static, Differencing = Dynamic"
$frmNEWVHDx.Controls.Add($NEWVHDxLabel4) 
$NEWVHDxDropDownBox4 = New-object System.Windows.Forms.ComboBox
$NEWVHDxDropDownBox4.Location = New-object System.Drawing.Size(20,360) 
$NEWVHDxDropDownBox4.Size = New-object System.Drawing.Size(100,20) 
$NEWVHDxDropDownBox4.DropDownHeight = 200 
$FDList=@("Fixed","Differencing")
foreach ($FD in $FDList) {$NEWVHDxDropDownBox4.Items.Add($FD)}
$frmNEWVHDx.Controls.Add($NEWVHDxDropDownBox4) 

$NEWVHDxTextbox1 = New-Object System.Windows.Forms.TextBox 
$NEWVHDxTextbox1.Location = New-Object System.Drawing.Size(20,390) 
$NEWVHDxTextbox1.Size = New-Object System.Drawing.Size(200,170)
$frmNEWVHDx.Controls.Add($NEWVHDxTextbox1) 
$NEWVHDxBrowseBtn1 = New-Object System.Windows.Forms.Button
$NEWVHDxBrowseBtn1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$NEWVHDxBrowseBtn1.Location = New-Object System.Drawing.Size(230,390)
$NEWVHDxBrowseBtn1.Size = New-Object System.Drawing.Size(250,23)
$NEWVHDxBrowseBtn1.Text = "Browse to Virtual Machine Path..."
$NEWVHDxBrowseBtn1.Add_Click({
     $VMPATH4 = $Browser.SelectFolder("Choose your Virtual Machine Path - Cancel = No change", "C:\", [IntPtr]::Zero)
	If($VMPATH4) { 
        [system.windows.forms.messagebox]::show($VMPATH4)
        $NEWVHDxTextbox1.Text = $VMPATH4}
     })
$frmNEWVHDx.Controls.Add($NEWVHDxBrowseBtn1)

#Start VM or leave off
$NEWVHDxLabel1 = New-Object System.Windows.Forms.Label
$NEWVHDxLabel1.Location = New-Object System.Drawing.Size(130,420)
$NEWVHDxLabel1.Size = New-Object System.Drawing.Size(300,20)  
$NEWVHDxLabel1.Text = "Start VM or Leave it Off?"
$frmNEWVHDx.Controls.Add($NEWVHDxLabel1) 
$NEWVHDxDropDownBox1 = New-Object System.Windows.Forms.ComboBox
$NEWVHDxDropDownBox1.Location = New-Object System.Drawing.Size(20,420) 
$NEWVHDxDropDownBox1.Size = New-Object System.Drawing.Size(100,20) 
$NEWVHDxDropDownBox1.DropDownHeight = 200 
$wksList=@("Start VM","Leave OFF")
foreach ($wks in $wksList) {$NEWVHDxDropDownBox1.Items.Add($wks)}
$frmNEWVHDx.Controls.Add($NEWVHDxDropDownBox1) 

$NEWVHDxLabel5 = New-object System.Windows.Forms.Label
$NEWVHDxLabel5.Location = New-object System.Drawing.Size(20,450)
$NEWVHDxLabel5.Size = New-Object System.Drawing.Size(500,20) 
$NEWVHDxLabel5.Text = "* Depending on the size and type choosen above this process can take several minutes"
$frmNEWVHDx.Controls.Add($NEWVHDxLabel5) 

$OKButton6 = New-Object System.Windows.Forms.Button
$OKButton6.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton6.Location = New-Object System.Drawing.Size(55,480)
$OKButton6.Size = New-Object System.Drawing.Size(75,23)
$OKButton6.Text = "OK"
$OKButton6.Add_Click({MakeNewVDX})
$frmNEWVHDx.Controls.Add($OKButton6) 

$ResetButton6 = New-Object System.Windows.Forms.Button
$ResetButton6.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ResetButton6.Location = New-Object System.Drawing.Size(150,480)
$ResetButton6.Size = New-Object System.Drawing.Size(75,23)
$ResetButton6.Text = "Reset"
$ResetButton6.Add_Click({clearform6})
$frmNEWVHDx.Controls.Add($ResetButton6) 
#RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR

#GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$frmNewVMeVHD = New-Object System.Windows.Forms.Panel 
$frmNewVMeVHD.Location = New-Object System.Drawing.Point(17, 70)
$frmNewVMeVHD.Size = New-Object System.Drawing.Size(500,500) 
$frmNewVMeVHD.BackColor = [System.Drawing.Color]::LightGray

#~~< frmNewVMeVHDTEXT >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmNewVMeVHDTEXT = New-Object System.Windows.Forms.Label
$frmNewVMeVHDTEXT.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$frmNewVMeVHDTEXT.Location = New-Object System.Drawing.Point(10, 33)
$frmNewVMeVHDTEXT.Size = New-Object System.Drawing.Size(442, 30)
$frmNewVMeVHDTEXT.Text = "This process may take a few minutes after you press OK, you will get a DONE button when the process completes."
$frmNewVMeVHD.Controls.Add($frmNewVMeVHDTEXT)

#~~< frmNewVMeVHDTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmNewVMeVHDTitle = New-Object System.Windows.Forms.Label
$frmNewVMeVHDTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$frmNewVMeVHDTitle.Location = New-Object System.Drawing.Point(10, 10)
$frmNewVMeVHDTitle.Size = New-Object System.Drawing.Size(346, 17)
$frmNewVMeVHDTitle.Text = "Create a new Virtual Machine with an existing VHD(x) file."
$frmNewVMeVHD.Controls.Add($frmNewVMeVHDTitle)

$NewVMeVHDLabel = New-Object System.Windows.Forms.Label
$NewVMeVHDLabel.Location = New-Object System.Drawing.Size(100,80) 
$NewVMeVHDLabel.Text = "New VM Name:"
$frmNewVMeVHD.Controls.Add($NewVMeVHDLabel) 
$NewVMeVHDTextBox = New-Object System.Windows.Forms.TextBox 
$NewVMeVHDTextBox.Location = New-Object System.Drawing.Size(10,80) 
$NewVMeVHDTextBox.Size = New-Object System.Drawing.Size(80,20) 
$frmNewVMeVHD.Controls.Add($NewVMeVHDTextBox) 

$NewVMeVHDLabel1 = New-Object System.Windows.Forms.Label
$NewVMeVHDLabel1.Location = New-Object System.Drawing.Size(100,110) 
$NewVMeVHDLabel1.Text = "RAM (GB):"
$frmNewVMeVHD.Controls.Add($NewVMeVHDLabel1) 
$NewVMeVHDTextBox1 = New-Object System.Windows.Forms.TextBox 
$NewVMeVHDTextBox1.Location = New-Object System.Drawing.Size(10,110) 
$NewVMeVHDTextBox1.Size = New-Object System.Drawing.Size(80,100) 
$frmNewVMeVHD.Controls.Add($NewVMeVHDTextBox1) 

$NewVMeVHDLabel2 = New-Object System.Windows.Forms.Label
$NewVMeVHDLabel2.Location = New-Object System.Drawing.Size(100,140) 
$NewVMeVHDLabel2.Text = "vCPU Count:"
$frmNewVMeVHD.Controls.Add($NewVMeVHDLabel2) 
$NewVMeVHDTextBox2 = New-Object System.Windows.Forms.TextBox 
$NewVMeVHDTextBox2.Location = New-Object System.Drawing.Size(10,140) 
$NewVMeVHDTextBox2.Size = New-Object System.Drawing.Size(80,80) 
$frmNewVMeVHD.Controls.Add($NewVMeVHDTextBox2) 

#existing vhdx file
$NewVMeVHDTextBox6 = New-Object System.Windows.Forms.TextBox 
$NewVMeVHDTextBox6.Location = New-Object System.Drawing.Size(10,170) 
$NewVMeVHDTextBox6.Size = New-Object System.Drawing.Size(200,170)
$frmNewVMeVHD.Controls.Add($NewVMeVHDTextBox6) 
$NewVMeVHDbrosweBtn1 = New-Object System.Windows.Forms.Button
$NewVMeVHDbrosweBtn1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$NewVMeVHDbrosweBtn1.Location = New-Object System.Drawing.Size(220,170)
$NewVMeVHDbrosweBtn1.Size = New-Object System.Drawing.Size(200,23)
$NewVMeVHDbrosweBtn1.Text = "Browse to VHD(x) file Location..."
$NewVMeVHDbrosweBtn1.Add_Click({
	$DiskPATH = PromptFor-File -InitialDirectory C:\ -Type open
	If($DiskPATH) { 
	[system.windows.forms.messagebox]::show($DiskPATH)
	$NewVMeVHDTextBox6.Text = $DiskPATH }})
$frmNewVMeVHD.Controls.Add($NewVMeVHDbrosweBtn1)

#vswitch
$NewVMeVHDLabel4 = New-Object System.Windows.Forms.Label
$NewVMeVHDLabel4.Location = New-Object System.Drawing.Size(125,200)
$NewVMeVHDLabel4.Size = New-Object System.Drawing.Size(300,20)  
$NewVMeVHDLabel4.Text = "vSwitch to attach VM to?"
$frmNewVMeVHD.Controls.Add($NewVMeVHDLabel4) 
$NewVMeVHDDropDownBox = New-Object System.Windows.Forms.ComboBox
$NewVMeVHDDropDownBox.Location = New-Object System.Drawing.Size(10,200) 
$NewVMeVHDDropDownBox.Size = New-Object System.Drawing.Size(100,20) 
$NewVMeVHDDropDownBox.DropDownHeight = 75
$NewVMeVHDDropDownBox.Add_Click({load1})
function load1 {
$NewVMeVHDDropDownBox.items.clear()
$vswitch1 = get-vmswitch
$vswitch1 | ForEach-Object {$NewVMeVHDDropDownBox.Items.Add($_.Name)}}
$frmNewVMeVHD.Controls.Add($NewVMeVHDDropDownBox) 

#Start VM or leave off
$NewVMeVHDLabel5 = New-Object System.Windows.Forms.Label
$NewVMeVHDLabel5.Location = New-Object System.Drawing.Size(125,230)
$NewVMeVHDLabel5.Size = New-Object System.Drawing.Size(300,20)  
$NewVMeVHDLabel5.Text = "Start VM or Leave it Off?"
$frmNewVMeVHD.Controls.Add($NewVMeVHDLabel5) 
$NewVMeVHDDropDownBox1 = New-Object System.Windows.Forms.ComboBox
$NewVMeVHDDropDownBox1.Location = New-Object System.Drawing.Size(10,230) 
$NewVMeVHDDropDownBox1.Size = New-Object System.Drawing.Size(100,20) 
$NewVMeVHDDropDownBox1.DropDownHeight = 200 
$TTTT=@("Start VM","Leave OFF")
foreach ($WW in $TTTT) {$NewVMeVHDDropDownBox1.Items.Add($WW)}
$frmNewVMeVHD.Controls.Add($NewVMeVHDDropDownBox1) 

$NewVMeVHDOKButton = New-Object System.Windows.Forms.Button
$NewVMeVHDOKButton.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$NewVMeVHDOKButton.Location = New-Object System.Drawing.Size(55,270)
$NewVMeVHDOKButton.Size = New-Object System.Drawing.Size(75,23)
$NewVMeVHDOKButton.Text = "OK"
$NewVMeVHDOKButton.Add_Click({MakeNewVMeVHD-oldDisk})
$frmNewVMeVHD.Controls.Add($NewVMeVHDOKButton) 

$NewVMeVHDResetButton = New-Object System.Windows.Forms.Button
$NewVMeVHDResetButton.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$NewVMeVHDResetButton.Location = New-Object System.Drawing.Size(150,270)
$NewVMeVHDResetButton.Size = New-Object System.Drawing.Size(75,23)
$NewVMeVHDResetButton.Text = "Reset"
$NewVMeVHDResetButton.Add_Click({clearform-frmNewVMeVHD})
$frmNewVMeVHD.Controls.Add($NewVMeVHDResetButton) 
#GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG

#PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
$frmNEWvmNEWvhd = New-object System.Windows.Forms.Panel 
$frmNEWvmNEWvhd.Location = New-Object System.Drawing.Point(17, 45)
$frmNEWvmNEWvhd.Size = New-object System.Drawing.Size(500,500)
$frmNEWvmNEWvhd.BackColor = [System.Drawing.Color]::LightGray 

#~~< frmNewVMeVHDTEXT >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmNewVMVHDTEXT1 = New-Object System.Windows.Forms.Label
$frmNewVMVHDTEXT1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$frmNewVMVHDTEXT1.Location = New-Object System.Drawing.Point(10, 33)
$frmNewVMVHDTEXT1.Size = New-Object System.Drawing.Size(442, 30)
$frmNewVMVHDTEXT1.Text = "This process will take a several minutes after you press OK, you will get a DONE button when the process completes."
$frmNEWvmNEWvhd.Controls.Add($frmNewVMVHDTEXT1)

#~~< frmNewVMeVHDTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmNewVMVHDTitle1 = New-Object System.Windows.Forms.Label
$frmNewVMVHDTitle1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$frmNewVMVHDTitle1.Location = New-Object System.Drawing.Point(10, 10)
$frmNewVMVHDTitle1.Size = New-Object System.Drawing.Size(346, 17)
$frmNewVMVHDTitle1.Text = "Create a new Virtual Machine with a new VHD(x) file."
$frmNEWvmNEWvhd.Controls.Add($frmNewVMVHDTitle1)

$NEWvmNEWvhdLabel = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel.Location = New-object System.Drawing.Size(100,70) 
$NEWvmNEWvhdLabel.Text = "New VM Name:"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel) 
$NEWvmNEWvhdTextBox = New-object System.Windows.Forms.TextBox 
$NEWvmNEWvhdTextBox.Location = New-object System.Drawing.Size(10,70) 
$NEWvmNEWvhdTextBox.Size = New-object System.Drawing.Size(80,20) 
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdTextBox) 

$NEWvmNEWvhdLabel1 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel1.Location = New-object System.Drawing.Size(100,100) 
$NEWvmNEWvhdLabel1.Text = "RAM (GB):"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel1) 
$NEWvmNEWvhdTextBox1 = New-object System.Windows.Forms.TextBox 
$NEWvmNEWvhdTextBox1.Location = New-object System.Drawing.Size(10,100) 
$NEWvmNEWvhdTextBox1.Size = New-object System.Drawing.Size(80,100) 
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdTextBox1) 

$NEWvmNEWvhdLabel2 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel2.Location = New-object System.Drawing.Size(100,130) 
$NEWvmNEWvhdLabel2.Text = "vCPU Count:"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel2) 
$NEWvmNEWvhdTextBox2 = New-object System.Windows.Forms.TextBox 
$NEWvmNEWvhdTextBox2.Location = New-object System.Drawing.Size(10,130) 
$NEWvmNEWvhdTextBox2.Size = New-object System.Drawing.Size(80,80) 
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdTextBox2) 

$NEWvmNEWvhdLabel3 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel3.Location = New-object System.Drawing.Size(100,160)
$NEWvmNEWvhdLabel3.size = New-Object System.Drawing.Size(120,20) 
$NEWvmNEWvhdLabel3.Text = "Virtual disk Size (GB):"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel3) 
$NEWvmNEWvhdTextBox3 = New-object System.Windows.Forms.TextBox 
$NEWvmNEWvhdTextBox3.Location = New-object System.Drawing.Size(10,160) 
$NEWvmNEWvhdTextBox3.Size = New-object System.Drawing.Size(80,170)
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdTextBox3) 

$NEWvmNEWvhdTextBox4 = New-object System.Windows.Forms.TextBox 
$NEWvmNEWvhdTextBox4.Location = New-object System.Drawing.Size(10,190) 
$NEWvmNEWvhdTextBox4.Size = New-object System.Drawing.Size(200,170)
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdTextBox4) 
$NEWvmNEWvhdBrowseButton = New-object System.Windows.Forms.Button
$NEWvmNEWvhdBrowseButton.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$NEWvmNEWvhdBrowseButton.Location = New-object System.Drawing.Size(220,190)
$NEWvmNEWvhdBrowseButton.Size = New-object System.Drawing.Size(200,23)
$NEWvmNEWvhdBrowseButton.Text = "Browse to ISO file Location"
$NEWvmNEWvhdBrowseButton.Add_Click({
	$ISOPATH = PromptFor-File -InitialDirectory C:\ -Type open
	If($ISOPATH) { 
	[system.windows.forms.messagebox]::show($ISOPATH)
	$NEWvmNEWvhdTextBox4.Text = $ISOPATH }
})
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdBrowseButton)

$NEWvmNEWvhdLabel3 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel3.Location = New-object System.Drawing.Size(10,220)
$NEWvmNEWvhdLabel3.Size = New-object System.Drawing.Size(400,38)  
$NEWvmNEWvhdLabel3.Text = "Type VHDx File? - Depending on the size (above) and type (below), this process can take several minutes"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel3) 
$RadioButton1 = New-Object System.Windows.Forms.RadioButton 
$RadioButton1.Location = new-object System.Drawing.Point(30,260) 
$RadioButton1.size = New-Object System.Drawing.Size(200,20) 
$RadioButton1.Text = "Fixed = Static" 
$frmNEWvmNEWvhd.Controls.Add($RadioButton1) 

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location = new-object System.Drawing.Point(30,290)
$RadioButton2.size = New-Object System.Drawing.Size(200,20)
$RadioButton2.Text = "Differencing = Dynamic"
$frmNEWvmNEWvhd.Controls.Add($RadioButton2) 

#vswitch
$NEWvmNEWvhdLabel4 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel4.Location = New-object System.Drawing.Size(125,335)
$NEWvmNEWvhdLabel4.Size = New-object System.Drawing.Size(300,20)  
$NEWvmNEWvhdLabel4.Text = "vSwitch to attach VM to?"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel4) 
$NEWvmNEWvhdDropDownBox = New-object System.Windows.Forms.ComboBox
$NEWvmNEWvhdDropDownBox.Location = New-object System.Drawing.Size(10,335) 
$NEWvmNEWvhdDropDownBox.Size = New-object System.Drawing.Size(100,20) 
$NEWvmNEWvhdDropDownBox.DropDownHeight = 75
$NEWvmNEWvhdDropDownBox.Add_Click({load4})
function load4 {
$NEWvmNEWvhdDropDownBox.items.clear() 
$vswitch4 = get-vmswitch
$vswitch4 | ForEach-Object {$NEWvmNEWvhdDropDownBox.Items.Add($_.Name)}}
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdDropDownBox) 

#Start VM or leave off
$NEWvmNEWvhdLabel5 = New-object System.Windows.Forms.Label
$NEWvmNEWvhdLabel5.Location = New-object System.Drawing.Size(125,365)
$NEWvmNEWvhdLabel5.Size = New-object System.Drawing.Size(300,20)  
$NEWvmNEWvhdLabel5.Text = "Start VM or Leave it Off?"
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdLabel5) 
$NEWvmNEWvhdDropDownBox1 = New-object System.Windows.Forms.ComboBox
$NEWvmNEWvhdDropDownBox1.Location = New-object System.Drawing.Size(10,365) 
$NEWvmNEWvhdDropDownBox1.Size = New-object System.Drawing.Size(100,20) 
$NEWvmNEWvhdDropDownBox1.DropDownHeight = 200 
$NEWvmNEWvhdList=@("Start VM","Leave OFF")
foreach ($NEWvmNEWvhd in $NEWvmNEWvhdList) {$NEWvmNEWvhdDropDownBox1.Items.Add($NEWvmNEWvhd)}
$frmNEWvmNEWvhd.Controls.Add($NEWvmNEWvhdDropDownBox1) 

$OKButton = New-object System.Windows.Forms.Button
$OKButton.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButton.Location = New-object System.Drawing.Size(55,400)
$OKButton.Size = New-object System.Drawing.Size(75,23)
$OKButton.Text = "OK"
$OKButton.Add_Click({MakeNewVM-NewDisk})
$frmNEWvmNEWvhd.Controls.Add($OKButton) 
 
$ResetButton = New-object System.Windows.Forms.Button
$ResetButton.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$ResetButton.Location = New-object System.Drawing.Size(150,400)
$ResetButton.Size = New-object System.Drawing.Size(75,23)
$ResetButton.Text = "Reset"
$ResetButton.Add_Click({clearform})
$frmNEWvmNEWvhd.Controls.Add($ResetButton) 

#PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP

#44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444

$frmVHOSTmgr = New-Object System.Windows.Forms.panel
$frmVHOSTmgr.Location = New-Object System.Drawing.Point(17, 3)
$frmVHOSTmgr.ClientSize = New-Object System.Drawing.Size(555, 548)
$frmVHOSTmgr.BackColor = [System.Drawing.Color]::LightGray

#~~< VHOSTmgrTEXT >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VHOSTmgrTEXT = New-Object System.Windows.Forms.Label
$VHOSTmgrTEXT.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$VHOSTmgrTEXT.Location = New-Object System.Drawing.Point(10, 30)
$VHOSTmgrTEXT.Size = New-Object System.Drawing.Size(442, 30)
$VHOSTmgrTEXT.Text = "Mange the VHost Virtual Paths and vSwitches, See bottom-left for Advanced vSwitch Functions button."
$frmVHOSTmgr.Controls.Add($VHOSTmgrTEXT)

#~~< VHOSTmgrTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VHOSTmgrTitle = New-Object System.Windows.Forms.Label
$VHOSTmgrTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$VHOSTmgrTitle.Location = New-Object System.Drawing.Point(10, 13)
$VHOSTmgrTitle.Size = New-Object System.Drawing.Size(346, 17)
$VHOSTmgrTitle.Text = "Configure VHOST settings"
$frmVHOSTmgr.Controls.Add($VHOSTmgrTitle)

#~~< VHOSTmgrTEXT BOX >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$outputBox1 = New-Object System.Windows.Forms.TextBox 
$outputBox1.Location = New-Object System.Drawing.Size(10,65) 
$outputBox1.Size = New-Object System.Drawing.Size(535,180)  
$outputBox1.MultiLine = $True 
$outputBox1.ScrollBars = "Vertical" 
$outputBox1.Font = new-object system.drawing.Font("Consolas", 8.25)
$frmVHOSTmgr.Controls.Add($outputBox1) 

$ActionPaths = New-Object System.Windows.Forms.Label
$ActionPaths.Location = New-Object System.Drawing.Size(10,255)
$ActionPaths.Size = New-Object System.Drawing.Size(500,18)  
$ActionPaths.Text = "Actions - Paths ----------------------------------------------------------------------------------------------------------------------------------------------."
$frmVHOSTmgr.Controls.Add($ActionPaths) 

#~~< VHOSTmgr Input button 1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    $VHOSTmgrTextbox1 = New-Object System.Windows.Forms.TextBox 
    $VHOSTmgrTextbox1.Location = New-Object System.Drawing.Size(10,275) 
    $VHOSTmgrTextbox1.Size = New-Object System.Drawing.Size(200,170)
    $frmVHOSTmgr.Controls.Add($VHOSTmgrTextbox1) 
    $BrowseButtonVMGR1 = New-Object System.Windows.Forms.Button
    $BrowseButtonVMGR1.FlatStyle = [System.Windows.Forms.FlatStyle]::System
    $BrowseButtonVMGR1.Location = New-Object System.Drawing.Size(220,275)
    $BrowseButtonVMGR1.Size = New-Object System.Drawing.Size(250,23)
    $BrowseButtonVMGR1.Text = "Browse to Virtual Hard Disk Path..."
    $BrowseButtonVMGR1.Add_Click({
        $VMPATH = $Browser.SelectFolder("Choose your Virtual Machine Path - Cancel = No change", "C:\", [IntPtr]::Zero)
		If($VMPATH) { 
        [system.windows.forms.messagebox]::show($VMPATH)
        $VHOSTmgrTextbox1.Text = $VMPATH}
    })
   $frmVHOSTmgr.Controls.Add($BrowseButtonVMGR1)
   
   #~~< VHOSTmgr Input button 2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    $VHOSTmgrTextbox2 = New-Object System.Windows.Forms.TextBox 
    $VHOSTmgrTextbox2.Location = New-Object System.Drawing.Size(10,305) 
    $VHOSTmgrTextbox2.Size = New-Object System.Drawing.Size(200,170)
    $frmVHOSTmgr.Controls.Add($VHOSTmgrTextbox2) 
    $BrowseButtonVMGR2 = New-Object System.Windows.Forms.Button
    $BrowseButtonVMGR2.FlatStyle = [System.Windows.Forms.FlatStyle]::System
    $BrowseButtonVMGR2.Location = New-Object System.Drawing.Size(220,305)
    $BrowseButtonVMGR2.Size = New-Object System.Drawing.Size(250,23)
    $BrowseButtonVMGR2.Text = "Browse to Virtual Machine Path..."
    $BrowseButtonVMGR2.Add_Click({
        $VHDPATH = $Browser.SelectFolder("Choose your Virtual HardDisk Path- Cancel = No change", "C:\", [IntPtr]::Zero)
		If($VHDPATH) { 
        [system.windows.forms.messagebox]::show($VHDPATH)
        $VHOSTmgrTextbox2.Text = $VHDPATH}
    })
   $frmVHOSTmgr.Controls.Add($BrowseButtonVMGR2)
   
 $OKButtonPaths = New-Object System.Windows.Forms.Button
 $OKButtonPaths.FlatStyle = [System.Windows.Forms.FlatStyle]::System
 $OKButtonPaths.Location = New-Object System.Drawing.Size(350,335)
 $OKButtonPaths.Size = New-Object System.Drawing.Size(165,25)
 $OKButtonPaths.Text = "OK to add Paths"
 $OKButtonPATHS.Add_Click({newpathsOK})
 $frmVHOSTmgr.Controls.Add($OKButtonPATHS) 
  
$ActionNewswitch = New-Object System.Windows.Forms.Label
$ActionNewswitch.Location = New-Object System.Drawing.Size(10,365)
$ActionNewswitch.Size = New-Object System.Drawing.Size(500,18)  
$ActionNewswitch.Text = "Actions - New vSwitch ----------------------------------------------------------------------------------------------------------------------------------------------."
$frmVHOSTmgr.Controls.Add($ActionNewswitch)

    ######vswitchnew
    $switchnew = New-Object System.Windows.Forms.Label
    $switchnew.Location = New-Object System.Drawing.Size(115,390)
    $switchnew.Size = New-Object System.Drawing.Size(425,20)  
    $switchnew.Text = "NIC InterfaceAlis to Create vSwitch from. Usuallly next to IP of VHOST listed above."
    $frmVHOSTmgr.Controls.Add($switchnew) 
    $switchnewDropDownBox = New-Object System.Windows.Forms.ComboBox
    $switchnewDropDownBox.Location = New-Object System.Drawing.Size(10,390) 
    $switchnewDropDownBox.Size = New-Object System.Drawing.Size(100,20) 
    $switchnewDropDownBox.DropDownHeight = 200
    $switchnewDropDownBox.Add_Click({load6})
	function load6 {
    $switchnewDropDownBox.items.clear()
    $IPADDRR = Get-NetIPAddress | Where-Object {$_.ipaddress -like "*.*.*.*"} | select interfacealias, ipaddress
    $IPADDRR | ForEach-Object {$switchnewDropDownBox.Items.Add($_.interfacealias)}}
    $frmVHOSTmgr.Controls.Add($switchnewDropDownBox) 
		
$Newswitchname = New-Object System.Windows.Forms.Label
$Newswitchname.Location = New-Object System.Drawing.Size(130,425) 
$Newswitchname.size = New-Object System.Drawing.Size(200,20)  
$Newswitchname.Text = "New vSwitch Name:"
 $frmVHOSTmgr.Controls.Add($Newswitchname) 
$newSNtextBox = New-Object System.Windows.Forms.TextBox 
$newSNtextBox.Location = New-Object System.Drawing.Size(10,425) 
$newSNtextBox.Size = New-Object System.Drawing.Size(110,20) 
 $frmVHOSTmgr.Controls.Add($newSNtextBox) 
  
 $OKnewVSWITCH = New-Object System.Windows.Forms.Button
 $OKnewVSWITCH.FlatStyle = [System.Windows.Forms.FlatStyle]::System
 $OKnewVSWITCH.Location = New-Object System.Drawing.Size(350,425)
 $OKnewVSWITCH.Size = New-Object System.Drawing.Size(165,25)
 $OKnewVSWITCH.Text = "OK to add New vSwitch"
 $OKnewVSWITCH.Add_Click({newVSWITCH})
$frmVHOSTmgr.Controls.Add($OKnewVSWITCH) 

$Actionremoveswitch = New-Object System.Windows.Forms.Label
$Actionremoveswitch.Location = New-Object System.Drawing.Size(10,455)
$Actionremoveswitch.Size = New-Object System.Drawing.Size(500,18)  
$Actionremoveswitch.Text = "Actions - Remove vSwitch ---------------------------------------------------------------------------------------------------------------------------------------------."
$frmVHOSTmgr.Controls.Add($Actionremoveswitch)

   
    ##############vswitchremove
    $vswitchremove = New-Object System.Windows.Forms.Label
    $vswitchremove.Location = New-Object System.Drawing.Size(115,480)
    $vswitchremove.Size = New-Object System.Drawing.Size(400,20)  
    $vswitchremove.Text = "vSwitch to remove? Must not have any VM's Attached to it!"
    $frmVHOSTmgr.Controls.Add($vswitchremove) 
    $vswitchremoveDropDownBox = New-Object System.Windows.Forms.ComboBox
    $vswitchremoveDropDownBox.Location = New-Object System.Drawing.Size(10,480) 
    $vswitchremoveDropDownBox.Size = New-Object System.Drawing.Size(100,20) 
    $vswitchremoveDropDownBox.DropDownHeight = 75 
    $vswitchremoveDropDownBox.Add_Click({load})
    	function load {
	$vswitchremoveDropDownBox.items.clear()
   	$vswitch = get-vmswitch
    	$vswitch | ForEach-Object {$vswitchremoveDropDownBox.Items.Add($_.Name)}}
    $frmVHOSTmgr.Controls.Add($vswitchremoveDropDownBox) 

 $OKremoveVSWITCH = New-Object System.Windows.Forms.Button
 $OKremoveVSWITCH.FlatStyle = [System.Windows.Forms.FlatStyle]::System
 $OKremoveVSWITCH.Location = New-Object System.Drawing.Size(350,510)
 $OKremoveVSWITCH.Size = New-Object System.Drawing.Size(165,25)
 $OKremoveVSWITCH.Text = "OK to Remove vSwitch"
 $OKremoveVSWITCH.Add_Click({removeVSWITCH})
$frmVHOSTmgr.Controls.Add($OKremoveVSWITCH) 

#44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444

#333333333333333333333333333333333333333333333333333

#~~< frmRAMvCPU >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmRAMvCPU = New-Object System.Windows.Forms.Panel
$frmRAMvCPU.Location = New-Object System.Drawing.Point(17, 3)
$frmRAMvCPU.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmRAMvCPU.BackColor = [System.Drawing.Color]::LightGray
#~~< GroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxRC = New-Object System.Windows.Forms.GroupBox
$GroupBoxRC.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxRC.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxRC.Location = New-Object System.Drawing.Point(15, 100)
$GroupBoxRC.Size = New-Object System.Drawing.Size(500, 225)
$GroupBoxRC.Text = "Virtual Machine List"
#~~< listViewRC >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewRC = New-Object System.Windows.Forms.ListView
$listViewRC.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewRC.View = 'Details'
$listViewRC.HideSelection = $False
$listViewRC.Location = New-Object System.Drawing.Size(10,15) 
$listViewRC.Width = 475
$listViewRC.Height = 195
$listViewRC.Columns.Add('VMName',300)
$listViewRC.Columns.Add('RAM',40)
$listViewRC.Columns.Add('vCPU Count',100)

$GroupBoxRC.Controls.Add($listViewRC)
$GroupBoxRC.ForeColor = [System.Drawing.Color]::Black
$frmRAMvCPU.Controls.Add($GroupBoxRC)

$RAMTEXT = New-Object System.Windows.Forms.Label
$RAMTEXT.Location = New-Object System.Drawing.Size(45,375)
$RAMTEXT.Size = New-Object System.Drawing.Size(145,20) 
$RAMTEXT.Text = "New RAM Amount(GB):"
$frmRAMvCPU.Controls.Add($RAMTEXT) 
$RAMBOX = New-Object System.Windows.Forms.TextBox 
$RAMBOX.Location = New-Object System.Drawing.Size(192,375) 
$RAMBOX.Size = New-Object System.Drawing.Size(40,20) 
$frmRAMvCPU.Controls.Add($RAMBOX) 

$vCPUText = New-Object System.Windows.Forms.Label
$vCPUText.Location = New-Object System.Drawing.Size(45,420)
$vCPUText.Size = New-Object System.Drawing.Size(120,20) 
$vCPUText.Text = "New vCPU Count:"
$frmRAMvCPU.Controls.Add($vCPUText) 
$vCPUBox = New-Object System.Windows.Forms.TextBox 
$vCPUBox.Location = New-Object System.Drawing.Size(192,420) 
$vCPUBox.Size = New-Object System.Drawing.Size(40,20) 
$frmRAMvCPU.Controls.Add($vCPUBox) 

    #Start VM or leave off
    $objLabel5 = New-Object System.Windows.Forms.Label
    $objLabel5.Location = New-Object System.Drawing.Size(45,460)
    $objLabel5.Size = New-Object System.Drawing.Size(145,20)  
    $objLabel5.Text = "Start VM or Leave it Off?"
    $frmRAMvCPU.Controls.Add($objLabel5) 
    $DropDownBox1 = New-Object System.Windows.Forms.ComboBox
    $DropDownBox1.Location = New-Object System.Drawing.Size(192,460) 
    $DropDownBox1.Size = New-Object System.Drawing.Size(100,20) 
    $DropDownBox1.DropDownHeight = 200 
    $wksList=@("Start VM","Leave OFF")
    foreach ($wks in $wksList) {$DropDownBox1.Items.Add($wks)}
    $frmRAMvCPU.Controls.Add($DropDownBox1)

#~~< btnProcess >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnProcess = New-Object System.Windows.Forms.Button
$btnProcess.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnProcess.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnProcess.Location = New-Object System.Drawing.Point(45, 495)
$btnProcess.Size = New-Object System.Drawing.Size(180, 26)
$btnProcess.Text = "Process Request"
$btnProcess.add_Click({ChangeRAMvCPU})

$frmRAMvCPU.Controls.Add($btnProcess)

#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActions = New-Object System.Windows.Forms.Label
$lblActions.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActions.Location = New-Object System.Drawing.Point(40, 350)
$lblActions.Size = New-Object System.Drawing.Size(172, 17)
$lblActions.Text = "Edit VM - RAM/vCPU Count"
$frmRAMvCPU.Controls.Add($lblActions)

#~~< lblCoreConfigText >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblCoreConfigText = New-Object System.Windows.Forms.Label
$lblCoreConfigText.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblCoreConfigText.Location = New-Object System.Drawing.Point(10, 30)
$lblCoreConfigText.Size = New-Object System.Drawing.Size(442, 23)
$lblCoreConfigText.Text = "Edit VM's RAM or vCPU Count (IF POWERED ON THIS WILL POWER OFF YOUR VM)"
$frmRAMvCPU.Controls.Add($lblCoreConfigText)

#~~< lblCoreConfigTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblCoreConfigTitle = New-Object System.Windows.Forms.Label
$lblCoreConfigTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblCoreConfigTitle.Location = New-Object System.Drawing.Point(10, 13)
$lblCoreConfigTitle.Size = New-Object System.Drawing.Size(346, 17)
$lblCoreConfigTitle.Text = "Virtual Machine RAM and vCPU Control"
$frmRAMvCPU.Controls.Add($lblCoreConfigTitle)

$frmRAMvCPU.Controls.Add($SplitContainer1)

#333333333333333333333333333333333333333333333333333

#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
$frmDVD = New-Object System.Windows.Forms.Panel
$frmDVD.Location = New-Object System.Drawing.Point(17, 3)
$frmDVD.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmDVD.BackColor = [System.Drawing.Color]::LightGray

#~~< GroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxDVD = New-Object System.Windows.Forms.GroupBox
$GroupBoxDVD.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxDVD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxDVD.Location = New-Object System.Drawing.Point(15, 100)
$GroupBoxDVD.Size = New-Object System.Drawing.Size(500, 225)
$GroupBoxDVD.Text = "Virtual Machine List"
#~~< listViewDVD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewDVD = New-Object System.Windows.Forms.ListView
$listViewDVD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewDVD.View = 'Details'
$listViewDVD.HideSelection = $False
$listViewDVD.Location = New-Object System.Drawing.Size(10,15) 
$listViewDVD.Width = 475
$listViewDVD.Height = 195
$listViewDVD.Columns.Add('VMName',220)
$listViewDVD.Columns.Add('Media',40)
$listViewDVD.Columns.Add('Path',220)

$GroupBoxDVD.Controls.Add($listViewDVD)
$GroupBoxDVD.ForeColor = [System.Drawing.Color]::Black
$frmDVD.Controls.Add($GroupBoxDVD)

#~~< btnEjectAll >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnEjectAll = New-Object System.Windows.Forms.Button
$btnEjectAll.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnEjectAll.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnEjectAll.Location = New-Object System.Drawing.Point(45, 375)
$btnEjectAll.Size = New-Object System.Drawing.Size(180, 26)
$btnEjectAll.Text = "Eject DVD From all VM's"
$btnEjectAll.add_Click({EjectALL})

#~~< btnEject >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnEject = New-Object System.Windows.Forms.Button
$btnEject.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnEject.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnEject.Location = New-Object System.Drawing.Point(45, 410)
$btnEject.Size = New-Object System.Drawing.Size(180, 26)
$btnEject.Text = "Eject a DVD from a VM"
$btnEject.add_Click({Eject})

#~~< btnInsert >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnInsert = New-Object System.Windows.Forms.Button
$btnInsert.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnInsert.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnInsert.Location = New-Object System.Drawing.Point(45, 445)
$btnInsert.Size = New-Object System.Drawing.Size(180, 26)
$btnInsert.Text = "Insert a DVD into a VM..."
$btnInsert.add_Click({Insert})

#~~< btnTOOLS >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnTOOLS = New-Object System.Windows.Forms.Button
$btnTOOLS.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnTOOLS.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnTOOLS.Location = New-Object System.Drawing.Point(45, 480)
$btnTOOLS.Size = New-Object System.Drawing.Size(180, 26)
$btnTOOLS.Text = "Insert MS Integration Tools DVD"
$btnTOOLS.add_Click({TOOLS})

#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActions = New-Object System.Windows.Forms.Label
$lblActions.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActions.Location = New-Object System.Drawing.Point(40, 350)
$lblActions.Size = New-Object System.Drawing.Size(172, 17)
$lblActions.Text = "DVD/ISO Actions"
$frmDVD.Controls.Add($btnEjectAll)
$frmDVD.Controls.Add($btnEject)
$frmDVD.Controls.Add($btnInsert)
$frmDVD.Controls.Add($btnTOOLS)
$frmDVD.Controls.Add($lblActions)
$frmDVD.Controls.Add($SplitContainer1)

#~~< DVDPageDescription >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$DVDPageDescription = New-Object System.Windows.Forms.Label
$DVDPageDescription.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$DVDPageDescription.Location = New-Object System.Drawing.Point(10, 30)
$DVDPageDescription.Size = New-Object System.Drawing.Size(442, 23)
$DVDPageDescription.Text = "Eject - Insert - MS Integration Tools"
$frmDVD.Controls.Add($DVDPageDescription)

#~~< DVDPageTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$DVDPageTitle = New-Object System.Windows.Forms.Label
$DVDPageTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$DVDPageTitle.Location = New-Object System.Drawing.Point(10, 13)
$DVDPageTitle.Size = New-Object System.Drawing.Size(346, 17)
$DVDPageTitle.Text = "Virtual Machine DVD Control"
$frmDVD.Controls.Add($DVDPageTitle)

#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#~~< frmRemove >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmRR = New-Object System.Windows.Forms.Panel
$frmRR.Location = New-Object System.Drawing.Point(17, 3)
$frmRR.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmRR.BackColor = [System.Drawing.Color]::LightGray

#~~< GroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBoxRR = New-Object System.Windows.Forms.GroupBox
$GroupBoxRR.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBoxRR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBoxRR.Location = New-Object System.Drawing.Point(15, 100)
$GroupBoxRR.Size = New-Object System.Drawing.Size(525, 225)
$GroupBoxRR.Text = "Virtual Machine List"
#~~< listViewRR >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewRR = New-Object System.Windows.Forms.ListView
$listViewRR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewRR.View = 'Details'
$listViewRR.HideSelection = $False
$listViewRR.Location = New-Object System.Drawing.Size(10,20) 
$listViewRR.Width = 495
$listViewRR.Height = 190
$listViewRR.Columns.Add('VMName',445)
$GroupBoxRR.Controls.Add($listViewRR)
$GroupBoxRR.ForeColor = [System.Drawing.Color]::Black
$frmRR.Controls.Add($GroupBoxRR)

#~~< btnRRSave >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnRRSave = New-Object System.Windows.Forms.Button
$btnRRSave.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnRRSave.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnRRSave.Location = New-Object System.Drawing.Point(45, 375)
$btnRRSave.Size = New-Object System.Drawing.Size(180, 26)
$btnRRSave.Text = "Remove VM and Save Files"
$btnRRSave.add_Click({RRSave})
$frmRR.Controls.Add($btnRRSave)

#~~< btnRRDelete >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnRRDelete = New-Object System.Windows.Forms.Button
$btnRRDelete.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnRRDelete.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnRRDelete.Location = New-Object System.Drawing.Point(45, 410)
$btnRRDelete.Size = New-Object System.Drawing.Size(180, 26)
$btnRRDelete.Text = "Remove VM and Delete Files"
$btnRRDelete.add_Click({RRDelete})
$frmRR.Controls.Add($btnRRDelete)

#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActions = New-Object System.Windows.Forms.Label
$lblActions.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActions.Location = New-Object System.Drawing.Point(40, 350)
$lblActions.Size = New-Object System.Drawing.Size(172, 17)
$lblActions.Text = "Remove Actions"
$frmRR.Controls.Add($lblActions)

#~~< lblActions1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActions1 = New-Object System.Windows.Forms.Label
$lblActions1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActions1.Location = New-Object System.Drawing.Point(325, 350)
$lblActions1.Size = New-Object System.Drawing.Size(172, 17)
$lblActions1.Text = "Rename Action"
$frmRR.Controls.Add($lblActions1)

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Size(325,380)
$objLabel.Size = New-Object System.Drawing.Size(85,20) 
$objLabel.Text = "New VM Name:"
$frmRR.Controls.Add($objLabel) 
$objTextBox = New-Object System.Windows.Forms.TextBox 
$objTextBox.Location = New-Object System.Drawing.Size(412,380) 
$objTextBox.Size = New-Object System.Drawing.Size(120,20) 
$frmRR.Controls.Add($objTextBox) 
#~~< btnRename >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnRename = New-Object System.Windows.Forms.Button
$btnRename.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnRename.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnRename.Location = New-Object System.Drawing.Point(325, 410)
$btnRename.Size = New-Object System.Drawing.Size(180, 26)
$btnRename.Text = "Rename Selected VM (VHost Only)"
$btnRename.add_Click({ReNameVM1})
$frmRR.Controls.Add($btnRename)

#~~< RRPageDescription >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RRPageDescription = New-Object System.Windows.Forms.Label
$RRPageDescription.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$RRPageDescription.Location = New-Object System.Drawing.Point(10, 30)
$RRPageDescription.Size = New-Object System.Drawing.Size(442, 23)
$RRPageDescription.Text = "When you Rename a VM, it is only on the VHOST not in VM's OS"
$frmRR.Controls.Add($RRPageDescription)

#~~< RRPageTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RRPageTitle = New-Object System.Windows.Forms.Label
$RRPageTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$RRPageTitle.Location = New-Object System.Drawing.Point(10, 13)
$RRPageTitle.Size = New-Object System.Drawing.Size(346, 17)
$RRPageTitle.Text = "Virtual Machine Remove and Rename Control"
$frmRR.Controls.Add($RRPageTitle)

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

#11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
#~~< frmHyperV >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$frmHyperV = New-Object System.Windows.Forms.panel
$frmHyperV.Location = New-Object System.Drawing.Point(17, 3)
$frmHyperV.ClientSize = New-Object System.Drawing.Size(553, 548)
$frmHyperV.BackColor = [System.Drawing.Color]::LightGray

#~~< SplitContainerHyperv1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SplitContainerHyperv1 = New-Object System.Windows.Forms.SplitContainer
$SplitContainerHyperv1.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$SplitContainerHyperv1.Location = New-Object System.Drawing.Point(-4, 66)
$SplitContainerHyperv1.Size = New-Object System.Drawing.Size(563, 500)
$SplitContainerHyperv1.SplitterDistance = 364
$SplitContainerHyperv1.BackColor = [System.Drawing.Color]::LightGray
#~~< SplitContainerHyperv1.Panel1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~< GroupBox2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBox2 = New-Object System.Windows.Forms.GroupBox
$GroupBox2.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBox2.Location = New-Object System.Drawing.Point(15, 282)
$GroupBox2.Size = New-Object System.Drawing.Size(333, 199)
$GroupBox2.Text = "Stopped Virtual Machines"
#~~< listViewStopped >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewStopped = New-Object System.Windows.Forms.ListView
$listViewStopped.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewStopped.View = 'Details'
$listViewStopped.HideSelection = $False
$listViewStopped.Location = New-Object System.Drawing.Size(14,20) 
$listViewStopped.Width = 305
$listViewStopped.Height = 121
$listViewStopped.Columns.Add('VMName',180)
$listViewStopped.Columns.Add('State',80)
$GroupBox2.Controls.Add($listViewStopped)
$GroupBox2.ForeColor = [System.Drawing.Color]::Black

#~~< btnStartVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnStartVM = New-Object System.Windows.Forms.Button
$btnStartVM.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnStartVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnStartVM.Location = New-Object System.Drawing.Point(14, 158)
$btnStartVM.Size = New-Object System.Drawing.Size(306, 26)
$btnStartVM.Text = "Start Virtual Machine"
$btnStartVM.add_Click({StartVM})
$GroupBox2.Controls.Add($btnStartVM)

#~~< GroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBox1 = New-Object System.Windows.Forms.GroupBox
$GroupBox1.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$GroupBox1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$GroupBox1.Location = New-Object System.Drawing.Point(14, 16)
$GroupBox1.Size = New-Object System.Drawing.Size(333, 240)
$GroupBox1.Text = "Running Virtual Machines (click VM to see Thumbnail)"
#~~< listViewRunning >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listViewRunning = New-Object System.Windows.Forms.ListView
$listViewRunning.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listViewRunning.View = 'Details'
$listViewRunning.HideSelection = $False
$listViewRunning.Location = New-Object System.Drawing.Size(14,20) 
$listViewRunning.Width = 305
$listViewRunning.Height = 135
$listViewRunning.Columns.Add('VMName',180)
$listViewRunning.Columns.Add('State',80)
$GroupBox1.Controls.Add($listViewRunning)
$GroupBox1.ForeColor = [System.Drawing.Color]::Black
#~~< btnConnectVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnConnectVM = New-Object System.Windows.Forms.Button
$btnConnectVM.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnConnectVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnConnectVM.Location = New-Object System.Drawing.Point(23, 205)
$btnConnectVM.Size = New-Object System.Drawing.Size(297, 26)
$btnConnectVM.Text = "Connect to Virtual Machine"
$btnConnectVM.add_Click({ConnectVM})
$GroupBox1.Controls.Add($btnConnectVM)
#~~< btnStopVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnStopVM = New-Object System.Windows.Forms.Button
$btnStopVM.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnStopVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnStopVM.Location = New-Object System.Drawing.Point(23, 170)
$btnStopVM.Size = New-Object System.Drawing.Size(297, 26)
$btnStopVM.Text = "Stop Virtual Machine"
$btnStopVM.add_Click({StopVM})
$GroupBox1.Controls.Add($btnStopVM)

$SplitContainerHyperv1.Panel1.Controls.Add($GroupBox2)
$SplitContainerHyperv1.Panel1.Controls.Add($GroupBox1)

#~~< SplitContainerHyperv1.Panel2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SplitContainerHyperv1.Panel2.BackColor = [System.Drawing.Color]::lightgray

#~~< listboxNetwork >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listboxNetwork = New-Object System.Windows.Forms.ListBox
$listboxNetwork.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listboxNetwork.FormattingEnabled = $true
$listboxNetwork.Location = New-Object System.Drawing.Point(15, 327)
$listboxNetwork.Size = New-Object System.Drawing.Size(161, 20)
#~~< Label2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Label2 = New-Object System.Windows.Forms.Label
$Label2.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$Label2.Location = New-Object System.Drawing.Point(12, 307)
$Label2.Size = New-Object System.Drawing.Size(172, 17)
$Label2.Text = "Total Number of VM's"
#~~< listboxNetwork1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listboxNetwork1 = New-Object System.Windows.Forms.ListBox
$listboxNetwork1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listboxNetwork1.FormattingEnabled = $true
$listboxNetwork1.Location = New-Object System.Drawing.Point(15, 377)
$listboxNetwork1.Size = New-Object System.Drawing.Size(161, 20)
#~~< Label21 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Label21 = New-Object System.Windows.Forms.Label
$Label21.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$Label21.Location = New-Object System.Drawing.Point(12, 357)
$Label21.Size = New-Object System.Drawing.Size(172, 17)
$Label21.Text = "Total Number Running"
#~~< listboxNetwork2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$listboxNetwork2 = New-Object System.Windows.Forms.ListBox
$listboxNetwork2.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$listboxNetwork2.FormattingEnabled = $true
$listboxNetwork2.Location = New-Object System.Drawing.Point(15, 417)
$listboxNetwork2.Size = New-Object System.Drawing.Size(161, 20)
#~~< Label22 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Label22 = New-Object System.Windows.Forms.Label
$Label22.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$Label22.Location = New-Object System.Drawing.Point(12, 397)
$Label22.Size = New-Object System.Drawing.Size(172, 17)
$Label22.Text = "Total Number Off"

#~~< PictureBoxSS >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$PictureBoxSS = New-Object System.Windows.Forms.PictureBox
$PictureBoxSS.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$PictureBoxSS.Location = New-Object System.Drawing.Point(15, 130)
$PictureBoxSS.Size = New-Object System.Drawing.Size(161, 141)
$PictureBoxSS.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$PictureBoxSS.BackColor = [System.Drawing.Color]::white
#~~< btnRefreshPic >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnRefreshPic = New-Object System.Windows.Forms.Button
$btnRefreshPic.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnRefreshPic.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnRefreshPic.Location = New-Object System.Drawing.Point(15, 68)
$btnRefreshPic.Size = New-Object System.Drawing.Size(161, 26)
$btnRefreshPic.Text = "Refresh Thumbnail"
$btnRefreshPic.add_Click({Screenshot($btnRefreshPic)})
#~~< btnRefreshVM >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnRefreshVM = New-Object System.Windows.Forms.Button
$btnRefreshVM.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnRefreshVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnRefreshVM.Location = New-Object System.Drawing.Point(15, 36)
$btnRefreshVM.Size = New-Object System.Drawing.Size(161, 26)
$btnRefreshVM.Text = "Refresh Virtual Machines"
$btnRefreshVM.add_Click({RefreshVM($btnRefreshVM)})
#~~< Label1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$Label1.Location = New-Object System.Drawing.Point(15, 111)
$Label1.Size = New-Object System.Drawing.Size(152, 16)
$Label1.Text = "Thumbnail"
$Label1.add_Click({Label1Click($Label1)})
#~~< lblActions >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$lblActions = New-Object System.Windows.Forms.Label
$lblActions.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$lblActions.Location = New-Object System.Drawing.Point(15, 16)
$lblActions.Size = New-Object System.Drawing.Size(172, 17)
$lblActions.Text = "Actions"
$SplitContainerHyperv1.Panel2.Controls.Add($listboxNetwork)
$SplitContainerHyperv1.Panel2.Controls.Add($Label2)
$SplitContainerHyperv1.Panel2.Controls.Add($listboxNetwork1)
$SplitContainerHyperv1.Panel2.Controls.Add($Label21)
$SplitContainerHyperv1.Panel2.Controls.Add($listboxNetwork2)
$SplitContainerHyperv1.Panel2.Controls.Add($Label22)
$SplitContainerHyperv1.Panel2.Controls.Add($PictureBoxSS)
$SplitContainerHyperv1.Panel2.Controls.Add($btnRefreshPic)
$SplitContainerHyperv1.Panel2.Controls.Add($btnRefreshVM)
$SplitContainerHyperv1.Panel2.Controls.Add($Label1)
$SplitContainerHyperv1.Panel2.Controls.Add($lblActions)

$frmHyperV.Controls.Add($SplitContainerHyperv1)

#~~< SSRPageDescription >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SSRPageDescription = New-Object System.Windows.Forms.Label
$SSRPageDescription.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$SSRPageDescription.Location = New-Object System.Drawing.Point(10, 30)
$SSRPageDescription.Size = New-Object System.Drawing.Size(442, 23)
$SSRPageDescription.Text = "Start, Stop or Connect to a Virtual Machine"
$frmHyperV.Controls.Add($SSRPageDescription)

#~~< SSRPageTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$SSRPageTitle = New-Object System.Windows.Forms.Label
$SSRPageTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$SSRPageTitle.Location = New-Object System.Drawing.Point(10, 13)
$SSRPageTitle.Size = New-Object System.Drawing.Size(346, 17)
$SSRPageTitle.Text = "Virtual Machine Control"
$frmHyperV.Controls.Add($SSRPageTitle)

#111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

####################### End region (below) - Main Page 

##############################################################################################

#~~< PictureBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$PictureBox1 = New-Object System.Windows.Forms.PictureBox
$PictureBox1.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Center
$PictureBox1.Location = New-Object System.Drawing.Point(25, 27)
$PictureBox1.Size = New-Object System.Drawing.Size(51, 45)
#region PictureBox1.BackgroundImage = ([System.Drawing.Image](...)
$PictureBox1.Image = ([System.Drawing.Image]([System.Drawing.Image]::FromStream((New-Object System.IO.MemoryStream(($$ = 

[System.Convert]::FromBase64String(
"iVBORw0KGgoAAAANSUhEUgAAADwAAAAvCAYAAAC/vqlHAAAAAXNSR0IArs4c6QAAAARnQU1BAACx"+
                                 "jwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAFGdJREFU"+
                                 "aEPtWglYVeXaTW/9dbXMKU1RQVEBmQRERQFREQVBRZB5lhnneWzSHHH2lmWOqGnOpDmUmZpevWY5"+
                                 "lJimZU4pcgbOgTOz7no30N9wu8+t2/Q/z3+eZ7H3OWfvffb61nqH79s88sj/v36dEcCxR+potoT7"+
                                 "arcNyVf9zWU0sKzur3PlP+FVygpbOGnfGrpEd3hCcfnO+GJuN2vejNij2RgcgON1vyXu4ebSsE1r"+
                                 "uy3Ec9z/vzcguBv+mGa171T9vrzd5cUZ2zVreqgN5zeifE8aNBt6f6A7kL+t8lDUEqyr35YkRzjY"+
                                 "t4ZXZw907+YLvtcQff6E+v34lqjaY9rNoZFUc7f+3UkbVKs8b1ScXQW+DJaHV01VgMVy/yI0m0LK"+
                                 "r6+LOrB5RrRl9GBn+Pr4ILBXIAoK8hA1dCjcXF2E+Emq3fpPS7xsedt+5TsTX9cdGLlFtcbvbPn+"+
                                 "fNhMepNN/43BVn63mrD+vrlKf89srtRVaT4uwj/me2LnnER8sCgEuYN6ICUlCQkJCUhJTkK/kGA4"+
                                 "tnMQ4ktJ/PE/nDiO16mnOzB6Vflbw8ZpN/R+QffelC2azaEHtNuGGi3qr2w2g9pgLb9nEMJW9c1K"+
                                 "89enKgzflFhN6tswq27CrL4Da4UahmPjcHp2F7w9LxpHl8ViTPogxMfFIjZ2GGJiomnzrqDlrSSe"+
                                 "SOJ1/jDiuj1pvrp3Jx6qODxhjW5/7lb1uoBS4xeHUGW1Gqy6u9Vky28bzHfP6Y3nN5qN1w5A/8lG"+
                                 "aC/tgeH+5wphs+prmLV3YS37HKotg3B2ZRSK50YjLjZWITtsWBQRjUER4XB16yRqlxCd/hDS6rX+"+
                                 "i3X78jbff/4RqFZ3NUucMkYNtopSEr1nsD64XGm8tNlkvLwL5vJvYNZ8DauhHOZbp6H7eB1014/B"+
                                 "SKUtlfzMoIP55GxolrfDiUXhSIiLIWEqHB3JmI5EZORgRHE/uE8Q2ju2FeJbqHaD35W49q3oqfp3"+
                                 "J39qvLQFlgclVu1bUVVU0WSrVFWarr9nqLy8o8r0gEpqqaRATcJU08J9m1ED81fHobuwDeVHnoN6"+
                                 "cxiMn+/HnW1DUDQnA3GRYdj1ciTeXxqP00vD8VLOAAweHIEIKj1oUDi6de0iNhfiY3+3MqbbnVZQ"+
                                 "cWb5R4YLRRQWVv6xMjNbVa+4Ww3Xj8BqMcOiu09175LwLZgeXCHpm7Dyvc1ihPHydjDeUfHhAuj+"+
                                 "vgKV1w7hzoYhOLM0FMWFWTixJBa3X/XDRwv74sjKNGyfNQg5sf0wMGwgwkJD0b9/P7hX2/wBEfCb"+
                                 "q63ZGjFNf2TaNe32WKtNd89qvLq/ynznH6CloX//OehPLlRGwVR6DaavT8Ny7zxMt8/CcPUANG8O"+
                                 "gf74HFgefgGr5hYs/F57YDTurg3G1S05+HS5L2xX1sFiNgK6L3B/UziOLByK95anY/XEEMREBGPA"+
                                 "gBAFvQL9aXNHIf4+0fw3I24u6j9dty+j6MGMR3QPXq5n03/woiQsVJkqpe6i8uQ80PYwXilW3lvL"+
                                 "rkFXnAHd29kw3TwJ092PSfgaJJkx20O7JwWlyztCe3QKTIYKGJnUDBISjH+LqQK2q9twY2VXHCxM"+
                                 "x9HFkZiX448Qlq7g4D7o168vuvp6o61DGyG+gDZ/7FcnjpMZ4z/fOvKK8coWmO5/BvWmAShb3R3G"+
                                 "z7ZDPK7dm4GyFSSwPQblb2ehfGcCbLS4TRRVfwmTJK938qDZlQzVukBodyXx+9tghleSmVF1C5V3"+
                                 "zzPZMRwYCmbNHViY3IwfTsf5BV2xb3Ea9s4eiOzoIPTt0xu9e/di8xJQ27SYSDzqVyHN0XuCF8t9"+
                                 "Kc3XeHrdRFp0l6KgzWaD7sRcPJjfFFqS0x0cC9UKJzxc2Az6D56HZstAWNVfoeLEHFp+Oo+JZwwP"+
                                 "gYZkzbR6lajITG5hvFeWXkf5jZPQfbQGuos7q8sYCZulhlN5m+oGVDujcXz+ALy7OBnTUgMRFNQL"+
                                 "vYICEejfA37du6JjB8XmF4iOv5g4T84klIstK+iJq29Ngb44AWZ9KQzMsuavPwR9jQrGp3ptD5KK"+
                                 "I9Fwxc4Vx2fDVLKb1k2FapUXVK93geF8UbXdy+/BVs5GhEoa73wC7ScbYLr2DktWqTIY+o/XV5ex"+
                                 "suvVpGlzmwxyyQZce9kR788LIeEABDKe/Xv6oWcPglvpz2tsvp5C1ftJ4vzSmcSWiJpyELfd+f6O"+
                                 "EO3SxVvBvLxg7JoVjVsvPoL7c55kEnqZd25BldlQHcPnXodmRwLYkMD05VGoN/RhDx2qWFe7PY5x"+
                                 "O4oDdEqxv1jdUloC46U3Yby4GRYNszlLmFK7tffYkalgvH5YIV5xkwnQaIDu2CwlbO5s7IM3Zw76"+
                                 "HuEeft3RnSor8OuKTi7OojbII+RfkpY2rmPH9lLrJOWvkJ7Wy8sT3TibqSX8ck4/XFg/ArYbmxmP"+
                                 "Z6BaH4SyNT1gurJHIax7pwDq1V2VGRInFCijohWnFkF39DmYrh9SjjGQnHZXIowlu4jdtPRN2PQk"+
                                 "r2UsS+1WfalsldptroTNoIF2Xz7K3vBj+MyD6atjuLF2IN6c/mPCfn7dFMK+vj7sydvW1u1FP0W4"+
                                 "X2CAP5NBEDzcXdGhfTtmQR/4suDXEl6WH4DzW6fA8MXe6hi22qD/+1I8WNEJmt3p0EsMv8IYXtyS"+
                                 "dp4F9ca+YN2G7sh0VJ4qrD7HxCT02Q4mtUzoD08iKT1slWXVZEs/Zzn7O0zfXGKBf0iFj0BDZ1R+"+
                                 "tFqxeeVHr6OipBi31vnjjWlx3yocUGPpHtw6O3VAayrrxK2A4o38EWHxOn2/Yfy4MSgsXKDMXmTK"+
                                 "1rpVSyV2fXy8FNIbJwbh6o5JwP5kNhImmBjHEsvmSqrw7lSUrvKBhmVJyy7K8uAyic5AxdlXoaHi"+
                                 "Dxc0paULYLpxRLG0YuuKMpS/MwLGq/vYpJTAcv8SqkjeQturi/ox9jNg/uYCzPcvw0LlDZd3Q711"+
                                 "CD55qRnWTwtnlpbEVQ1PDzfFwu0plDQn7hRN9v8lYdp308lTJzBu/FjFErkj8pA9Kg3DM4criUAu"+
                                 "JBcYnxiIS6sisHv2YHy6sAusJW9ysmtkQnkAKwnIPFi1dRgevtEDZonhov4oWxvAQRimJDLtjnio"+
                                 "GQaV595Q1JZX+d7hjPMwcFKilK8KOkF/YAzM91iz755j6PyDNj4BbXEWy2AY7Z2Lr9YFYdvUAIVk"+
                                 "d9q4XVt7WridUp7kPt1IuFMn558mzK7lhYMH31F8P3rkGBRMzsLU/UORmppKpCApKUG5kGQ/P19X"+
                                 "5IZ7Y9+cCJxYGoX7RaGwfXNOyaC6Q6OhWtuTMZqslKSHyxyh3T8KOnZh5i8OKwQlQak5IOqNITDf"+
                                 "OavEe9mS1kxwQRwM1ubdyUz6FlhV15XEpn9vClSveqJsXW+Gx0rg9hlYd4Zj04wwJUbt27SCE3OP"+
                                 "t3dneHAA5D5dSfzfEibRaUK4A9u1kQWjkDsqA6mjIkk2WZmgJycnKOQHRgxCG/6IT5cuSI6NxOKx"+
                                 "YZzPxuHMwn7Q7U9DxXuToFrZngRaQn/0BSVplR+bC86bYTi9rDqGmYgMl3eCa13gogGbk0Roqb5q"+
                                 "RXuYOCj696Ypx1V+9Bo0dIgMXOX5DbDc+RimC3TGha2YmcKa205UdUB7hpzMpmQrygpp2Qrpf2Pp"+
                                 "ttM+OHaUMxIfzHxuOnLH52L8riEkmqSom5iYgPT0NC7H5GPChHFKzLRs0VypgSlxg7FxagiOr4jD"+
                                 "Z4UB0G/hTW4PY+xdRPn+PJIdj9JtMbi3xIExPVUhxWynkKpiAtMdmkC1g5XyZblLxXenKg5R0baS"+
                                 "A6yaEtb06xyBEmwregPPtLBHiNezmBznDakqtYQdSbodB6BDDXFRWvZ/IoarCTdu2AAB/oHITI/B"+
                                 "89PjFaJiaSE6YkQB8vNzkZeXg5ycanhwJMVWffv2xqikEBTPDsX++Sm4tqw7cPMwtGu64fPlPXB9"+
                                 "fTx0W0Kh4UxJtbYXbV3E2s1JgoQBk5aGXZokuwqWndJ5DZSOzXzvItvRTwB1Cb68sB8evt3g5fgU"+
                                 "ZqZ1x5IsT2QO6aYQEhVF4VrCQrqWeE2Znf2jLN2hveOsq1ev4uj7RzByZAHXl6KwZlkSsrNzMXr0"+
                                 "KIWsLLbl5+YiNzeLn2chK0u2mRg6dIiS1FxYAiIGDsCohL44vSIWJZvycXaWM869GoNrm/NhvH20"+
                                 "2qrnVuPhaz5KtpVuq3xfHh5KDDMrc7kI2q2DWZLKSJRk755i6AyG47NPYWxkOyybmozlc6fgeVo6"+
                                 "fkCXnyQs5CXfiBguzh0SSfh7y8B13N1cVi1eVCgt2ge8+WvBVGzs2DEYN24cB2AkRuTnK8rm5WVT"+
                                 "2WxkMntnEcOHp9Hq6cr7Xmzi7Vo+q0zUl4/qi80vDsPRRVE4uSIClzYXABeVlUxYpexwxaP83Sl4"+
                                 "8Dc3qN+KVZoU1bJ2XBAoZmyP50G38dzUKWjZtBGG+zfFygkhWDg1AwumpGPpiyMxL70zsgd7f4+w"+
                                 "KK2oy4zdliDZk40aNuhGso2I7y0I1q1fr95f7e1bybpwq7p163Zk5nvNqaMjoocNxYSJE6rVpZ1z"+
                                 "c3MUZTOzMpCZkY4MIj1dMnkykaRspZcVxf3Z0If0D8WrY/vi4oYMXH9jCKo+Xc/wtSiLBFYjl3io"+
                                 "sHpvNkoZr5rNA9iGfYodhcPR2K4DenVqjLmZ/iQ6HAsmpyqECyfGY26KO8ZG+yAx2KmaMNGhxtKi"+
                                 "qn2b1voGDZ4qJJdhRFfhREhP/e1i4KN88zTRlggkBhFDH3/88ezWrewueri7I41ERo8eqagrNh4+"+
                                 "XNTNQFpaGpHC5JaoZPLk5GREhA9E5JDBSqlw5EhHh/mjaFowil/ojyOF0biztg9w7yzXtLRKKSs/"+
                                 "PA5VuxJw+ZX+8PJglm37NGYkeGGRKDo5RSFbODUNC7J9MSHKFXlDeyA6yEXpopSkVaOsg30bNGnS"+
                                 "+Cjv/SViPJFAiMJ2xF+/S/h/+OYZwp0YQMQRKUQOMeWp+vU3UPEKac6FbC5tnZmZ8a26UrYESUmJ"+
                                 "iE+IZ/HvpJSFsNAQ9OkbpKjtSdXD+gdjblZP7F8Yi5ML2HIWp9K6auD4WKT3tkd7+xYYM9QDi7N8"+
                                 "sHBGvkJW1F00ojdmxDhhVHQ3JA3whK+7I4n+L1mxb4vmza7Qmct5vzOIfBGshqx9jZgi6revWsJu"+
                                 "/KQX0ZvoW3OSkJ5GzG/SuNGxtqx9IVxpyKO1h9POoq7YWNSVdjQhLg4+bAB8vL3QmSQ7e3pwEW6g"+
                                 "8lkru5ZKUx8THohXaPNTf4vG1MiOaNHSHulhXliW5ohFM7IxPzcQC2cWYPH4wXgp0Rkjo3sgP7Iz"+
                                 "Aro4UdWOcK4hK7Ha2q7lwyeeeHzdd1SVBNWP8CDEyrLK+aOVEGHfkJBHHO0IB0LsLSdJXIvi0oA/"+
                                 "X7dOnaUtnm12WRp0sW1OTta36iYmxiM+PobK9lfWnNzY2glBF25lFhM6oL/S2Isi8nnbVq3g5+GI"+
                                 "iWxXZ6d4Ykm2F5bMnkTr+uPF1M5Um4kpqjsiAjrChVM9FxcnODt3VEqQg30ra4MGT+7hPb1MTCLS"+
                                 "iYFEl5p7l0Ql09y/ED9ayJeULVmsPvEkIQEuaEyIJToTYvVUQmLjJcb3Wo7uA+llY7menJaWSoXj"+
                                 "WLcTlX5W0JvNiUw4ZOYlsy75TOp1H0LKhcSeF50Q7u+MpLBumBTni5WTh2FBnB1yhgZiUC83dHZ3"+
                                 "UshKm9iRx7flec2aNjlTp06d+byP6YQ4MJLoQcgqR7Oae/+ehfnZ914yAkJatt+FnCTB3pRwJCQB"+
                                 "RBDDicnEHI7yXo62RZZXRGFR3Nurs9LXdvZ0V5r7IJYrmb2IrSWRhbFWe3q4c4LupPTBHtz39nTF"+
                                 "mBhfjIwNwuiYniTsD3dXZ+XJgzPPkXLTsmXzG48++ugK/u5MooCIJST8XIkWRK19a7n8kOd/9F5O"+
                                 "lhgX5eWiLoRkckn58qMzOdoLmz7T5Ex73lQfzqVTU5KVOXUn2k/m0qKsKCyzMCkbixYtRPHePcqU"+
                                 "UyHMgfFwd0NXb2f08XNFdB93DAkkWaoqDUTrNna6evWeKOJvzSImEGmEOM6baEM0JH7Svv8Ryx8c"+
                                 "VOsACX4ZRSEuCe678f3Co8ySVOG6xFko41isLkSliVdWIHjzhw4e5OSkQMniYm87uxYk7KYQdifc"+
                                 "3FyV2Y7UV3uH1mj09NMH+Ds/jFNffuZANCHEgf8yTn8J0R+eI8Tl4jKakhQkvmWUZbSljI0TFajG"+
                                 "Jq44aD2pnDwQCx8YqhB0ZAweP3YMTiQj68riBjtOQLy8PeHJWi/EZbDEBc2faXqOzlnA60mFqI1T"+
                                 "f+47Ed+N09/lPweEuMS3JLba+O7O/cFEFjGFmNuo0dMHJMl0pa2l3/ZlAhPCEpOibk9/P4WcqO/a"+
                                 "iQNCB7Sye/bWY4899irPf56QyhBf4ySJU2kgfpU4/aXq18a3ZPfa+JY6HkOMIGZQpcXNmzc9L/NW"+
                                 "F2cnnCBh6Y7k6UHvoCA4kHD1k8FWlfXr198mDiGkEkhF6F/joN8kTn8p6dr4lrImoy/FXjq2YEKa"+
                                 "gNHEC3/5S93FzZs9c/nkhyfQpPHTSl/excdLnhRUPfVk/R08Zg4h9TSTkEogPbD0BFIaf9M4/W+I"+
                                 "fze+HXghHyKUSBPFGzdqePD8Jx/jxPFjyM/LpeLO10i4nN9NJLIJqafyRNCZkAdk4hwJnd8lTn8p"+
                                 "cTmvNr6lP29PSHxHNGnSaFEu59FMYF9zNlPsyDbVtZMT+J3UUwkFKXktCXGKOOa/qqf/DYGfe26t"+
                                 "zWvrt6glXVAgG/xkbiXzvsj9yeyalnDfj3AgZMYmRH+zMvNzifzc42u7NiEuZUxIy2OPXEKSmsSr"+
                                 "NPpiYSH7b9vBn/vjf+TxQlziUeq2tKfhhCQmIduZEBtLifvTx+rPGUSxqtTsDoRkcfmvHOnPpZxJ"+
                                 "2yrq/nH/nvRzmPyHx9bOyIRcwxqSMgjSrkrM/i6vfwKg1+/8UfRK3AAAAABJRU5ErkJggg==")),0,$$.Length)))))
#endregion

#~~< MenuStrip1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$MenuStrip1 = New-Object System.Windows.Forms.MenuStrip
$MenuStrip1.AutoSize = $True
$MenuStrip1.GripMargin = New-Object System.Windows.Forms.Padding(2)
$MenuStrip1.Location = New-Object System.Drawing.Point(0, 0)
$MenuStrip1.Padding = New-Object System.Windows.Forms.Padding(6, 0, 0, 1)
$MenuStrip1.BackColor = [System.Drawing.Color]::LightGray
#~~< ToolsToolStripMenuItem >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ToolsToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$ToolsToolStripMenuItem.Size = New-Object System.Drawing.Size(44, 19)
$ToolsToolStripMenuItem.Text = "Tools"
#~~< menuCMD >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuCMD = New-Object System.Windows.Forms.ToolStripMenuItem
$menuCMD.Size = New-Object System.Drawing.Size(179, 22)
$menuCMD.Text = "Command Prompt"
$menuCMD.add_Click({MenuCMD})
#~~< menuTaskMgr >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuTaskMgr = New-Object System.Windows.Forms.ToolStripMenuItem
$menuTaskMgr.Size = New-Object System.Drawing.Size(179, 22)
$menuTaskMgr.Text = "Task Manager"
$menuTaskMgr.add_Click({MenuTaskMgr})
#~~< menuRegistry >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuRegistry = New-Object System.Windows.Forms.ToolStripMenuItem
$menuRegistry.Size = New-Object System.Drawing.Size(179, 22)
$menuRegistry.Text = "Registry Editor"
$menuRegistry.add_Click({MenuRegistry})
#~~< menuSystem >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuSystem = New-Object System.Windows.Forms.ToolStripMenuItem
$menuSystem.Size = New-Object System.Drawing.Size(179, 22)
$menuSystem.Text = "System Info"
$menuSystem.add_Click({MenuSystem})
#~~< menuServices >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuServices = New-Object System.Windows.Forms.ToolStripMenuItem
$menuServices.Size = New-Object System.Drawing.Size(179, 22)
$menuServices.Text = "Services"
$menuServices.add_Click({menuServices})
#~~< menuEventvwr >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuEventvwr = New-Object System.Windows.Forms.ToolStripMenuItem
$menuEventvwr.Size = New-Object System.Drawing.Size(179, 22)
$menuEventvwr.Text = "Event Viewer"
$menuEventvwr.add_Click({menuEventvwr})
#~~< menuFirewall >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$menuFirewall = New-Object System.Windows.Forms.ToolStripMenuItem
$menuFirewall.Size = New-Object System.Drawing.Size(179, 22)
$menuFirewall.Text = "FireWall Settings"
$menuFirewall.add_Click({menuFirewall})

$ToolsToolStripMenuItem.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]](@($menuCMD, $menuTaskMgr, $menuRegistry, $menuSystem, 

$menuServices, $menuEventvwr, $menuFirewall)))
#~~< HelpLogsStripMenuItem >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$HelpLogsStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$HelpLogsStripMenuItem.Size = New-Object System.Drawing.Size(40, 19)
$HelpLogsStripMenuItem.Text = "Help"
#~~< AboutToolStripMenuItem >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$AboutToolStripMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$AboutToolStripMenuItem.Size = New-Object System.Drawing.Size(297, 22)
$AboutToolStripMenuItem.Text = "About"
$AboutToolStripMenuItem.add_Click({MenuAbout($AboutToolStripMenuItem)})
$HelpLogsStripMenuItem.DropDownItems.AddRange([System.Windows.Forms.ToolStripItem[]](@($AboutToolStripMenuItem)))
$MenuStrip1.Items.AddRange([System.Windows.Forms.ToolStripItem[]](@($ToolsToolStripMenuItem, $HelpLogsStripMenuItem)))

$HypervFORM.Controls.Add($MenuStrip1)

#~~< groupboxInfo5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$groupboxInfo5 = New-Object System.Windows.Forms.GroupBox
$groupboxInfo5.Font = New-Object System.Drawing.Font("Tahoma", 6.75, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$groupboxInfo5.Location = New-Object System.Drawing.Point(400, 21)
$groupboxInfo5.Size = New-Object System.Drawing.Size(375, 57)
#~~< ComputerInfo5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComputerInfo5 = New-Object System.Windows.Forms.Label
$ComputerInfo5.Font = New-Object System.Drawing.Font("Tahoma", 6.75, [System.Drawing.FontStyle]::Bold)
$ComputerInfo5.Location = New-Object System.Drawing.Point(8, 10)
$ComputerInfo5.Size = New-Object System.Drawing.Size(107, 16)
$ComputerInfo5.Text = "ComputerName"
#~~< DomainInfo5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$DomainInfo5 = New-Object System.Windows.Forms.Label
$DomainInfo5.Font = New-Object System.Drawing.Font("Tahoma", 6.75, [System.Drawing.FontStyle]::Bold)
$DomainInfo5.Location = New-Object System.Drawing.Point(8, 25)
$DomainInfo5.Size = New-Object System.Drawing.Size(116, 16)
$DomainInfo5.Text = "WorkGroupOrDomain"
#~~< VersionInfo5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VersionInfo5 = New-Object System.Windows.Forms.Label
$VersionInfo5.Font = New-Object System.Drawing.Font("Tahoma", 6.75, [System.Drawing.FontStyle]::Bold)
$VersionInfo5.Location = New-Object System.Drawing.Point(8, 41)
$VersionInfo5.Size = New-Object System.Drawing.Size(98, 14)
$VersionInfo5.Text = "Version"
#~~< ComputerValue5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComputerValue5 = New-Object System.Windows.Forms.Label
$ComputerValue5.Font = New-Object System.Drawing.Font("Tahoma", 6.75)
$ComputerValue5.Location = New-Object System.Drawing.Point(130, 10)
$ComputerValue5.Size = New-Object System.Drawing.Size(200, 15)
$ComputerValue5.Text = $Env:COMPUTERNAME
#~~< DomainValue5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$DomainValue5 = New-Object System.Windows.Forms.Label
$DomainValue5.Font = New-Object System.Drawing.Font("Tahoma", 6.75)
$DomainValue5.Location = New-Object System.Drawing.Point(130, 25)
$DomainValue5.Size = New-Object System.Drawing.Size(200, 16)
$DomainValue5.Text = (gwmi WIN32_ComputerSystem).Domain
#~~< VersionValue5 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$VersionValue5 = New-Object System.Windows.Forms.Label
$VersionValue5.Font = New-Object System.Drawing.Font("Tahoma", 6.75)
$VersionValue5.Location = New-Object System.Drawing.Point(130, 41)
$VersionValue5.Size = New-Object System.Drawing.Size(240, 14)
$VersionValue5.Text = (Get-WmiObject -class Win32_OperatingSystem).Caption
$groupboxInfo5.Controls.Add($ComputerInfo5)
$groupboxInfo5.Controls.Add($DomainInfo5)
$groupboxInfo5.Controls.Add($VersionInfo5)
$groupboxInfo5.Controls.Add($ComputerValue5)
$groupboxInfo5.Controls.Add($DomainValue5)
$groupboxInfo5.Controls.Add($VersionValue5)
$HypervFORM.Controls.Add($groupboxInfo5)

#~~< MainPageDescription >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$MainPageDescription = New-Object System.Windows.Forms.Label
$MainPageDescription.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$MainPageDescription.Location = New-Object System.Drawing.Point(100, 50)
$MainPageDescription.Size = New-Object System.Drawing.Size(518, 16)
$MainPageDescription.Text = "Manage your Virtual Machines and VHost from here"

#~~< lblCoreConfigTitle >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$MainPageTitle = New-Object System.Windows.Forms.Label
$MainPageTitle.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$MainPageTitle.Location = New-Object System.Drawing.Point(100, 33)
$MainPageTitle.Size = New-Object System.Drawing.Size(350, 20)
$MainPageTitle.Text = "PSHVM 30 - Powershell Hyper-V Manager"
$HypervFORM.Controls.Add($SplitContainer1)
$HypervFORM.Controls.Add($PictureBox1)
$HypervFORM.Controls.Add($MainPageDescription)
$HypervFORM.Controls.Add($MainPageTitle)

#~~< btnADVnetwork >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnADVnetwork = New-Object System.Windows.Forms.Button
$btnADVnetwork.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnADVnetwork.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnADVnetwork.Location = New-Object System.Drawing.Point(10, 665)
$btnADVnetwork.Size = New-Object System.Drawing.Size(220, 26)
$btnADVnetwork.Text = "Advanced vSwitch and NIC Teaming..."
$btnADVnetwork.add_Click({Start-Process PowerShell.exe –ArgumentList ".\SwitchesAndTeams.ps1"})
$HypervFORM.Controls.Add($btnADVnetwork)

#~~< btnReport >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnReport = New-Object System.Windows.Forms.Button
$btnReport.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnReport.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnReport.Location = New-Object System.Drawing.Point(240, 665)
$btnReport.Size = New-Object System.Drawing.Size(220, 26)
$btnReport.Text = "Detailed VHost and VM Report..."
$btnReport.add_Click({Start-Process PowerShell.exe –ArgumentList ".\report.ps1"})
$HypervFORM.Controls.Add($btnReport)

#~~< btnCancel >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnCancel = New-Object System.Windows.Forms.Button
$btnCancel.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$btnCancel.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point,([System.Byte](0)))
$btnCancel.Location = New-Object System.Drawing.Point(650, 665)
$btnCancel.Size = New-Object System.Drawing.Size(98, 26)
$btnCancel.Text = "Close"
$btnCancel.add_Click({$HypervFORM.Close()})
$HypervFORM.Controls.Add($btnCancel)


###################################### region Panel 1 Functions ##########################################

function VHMGRClick
{
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
		
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
                $SplitContainer1.Panel2.Controls.Add($frmVHOSTmgr)
                $frmVHOSTmgr = [System.Windows.Forms.DockStyle]::Fill
                display-info               

}

function RenameVMClick
{
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
			
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
                $SplitContainer1.Panel2.Controls.Add($frmRR)
                $frmRR = [System.Windows.Forms.DockStyle]::Fill
                startHyperVRR

}

function DVDMGRClick
{
		$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
			
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
           	$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
                $SplitContainer1.Panel2.Controls.Add($frmDVD)
                $frmDVD = [System.Windows.Forms.DockStyle]::Fill
                startHyperVDVD
                
				
}

function SSRDPClick
{
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	
                # hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
		$SplitContainer1.Panel2.Controls.Add($frmHyperV)
                $frmHyperV.Dock = [System.Windows.Forms.DockStyle]::Fill
                RefreshVM
			

}

function RAMvCPUclick
{
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	      	
        	# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
		$SplitContainer1.Panel2.Controls.Add($frmRAMvCPU)
                $frmRAMvCPU.Dock = [System.Windows.Forms.DockStyle]::Fill
                StartRMAvCPU	
}

function NewVMvhdClick
{
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))        
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
		
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($VHDexists)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)		
                $SplitContainer1.Panel2.Controls.Add($frmNEWvmNEWvhd)
		$frmNEWvmNEWvhd = [System.Windows.Forms.DockStyle]::Fill
                #put function here
		#NONE

}

function VHDexistsClick
{
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
			
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($NewVMeVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)		
                $SplitContainer1.Panel2.Controls.Add($frmExistVHD)
		$frmExistVHD = [System.Windows.Forms.DockStyle]::Fill
                #put function here
		LoadVM1s
}

function NewVHDClick
{
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
			
		# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)		
                $SplitContainer1.Panel2.Controls.Add($frmNEWVHDx)
                $frmNEWVHDx = [System.Windows.Forms.DockStyle]::Fill
                #put function here
                LoadVMs
				
}

function NewVMeVHDClick
{
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))	
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	
                # hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)			
		$SplitContainer1.Panel2.Controls.Add($frmNewVMeVHD)
                $frmNewVMeVHD= [System.Windows.Forms.DockStyle]::Fill
                #put function here
		#NONE
		

}

function ExportVMclick
{
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
		   
        	# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)        
		$SplitContainer1.Panel2.Controls.Add($frmExportVM)
                $frmExportVM = [System.Windows.Forms.DockStyle]::Fill
                #put function here
		startEXPORT
}

function ImportVMclick
{
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	   
        	# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM) 
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)       
		$SplitContainer1.Panel2.Controls.Add($frmImportVM)
                $frmImportVM = [System.Windows.Forms.DockStyle]::Fill
                #put function here
}

function NetworkVMclick
{
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	   
        	# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmINFO)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)        
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Add($frmNetworkVM)
                $frmNetworkVM = [System.Windows.Forms.DockStyle]::Fill
                #put function here
		LoadVMnw1
}

function SummaryClick
{
	$Summary.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NetworkVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ImportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $ExportVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $VHMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$RenameVM.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$DVDMGR.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$SSRDP.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $RAMvCPU.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
        $NewVMvhd.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$VHDexists.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	$NewVMeVHD.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point, ([System.Byte] ( 0 ) ))
	   
        	# hyper-v manger and the fucntion to load to populate it.
                $SplitContainer1.Panel2.Controls.Remove($frmVHOSTmgr)
                $SplitContainer1.Panel2.Controls.Remove($frmRR)
                $SplitContainer1.Panel2.Controls.Remove($frmDVD)
		$SplitContainer1.Panel2.Controls.Remove($frmHyperV)
		$SplitContainer1.Panel2.Controls.Remove($frmRAMvCPU)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWvmNEWvhd)
                $SplitContainer1.Panel2.Controls.Remove($frmNewVMeVHD)
                $SplitContainer1.Panel2.Controls.Remove($frmNEWVHDx)
		$SplitContainer1.Panel2.Controls.Remove($frmExistVHD)
		$SplitContainer1.Panel2.Controls.Remove($frmExportVM)        
		$SplitContainer1.Panel2.Controls.Remove($frmImportVM)
		$SplitContainer1.Panel2.Controls.Remove($frmNetworkVM)
		#put function here
		Displayinfo
}

################################################## End of panel 1 settings - functions Start ###################################################################################

function Main
{
 Displayinfo
 $HypervFORM.ShowDialog()
}

# start stop connect listview population function
function startHyperV
{	$VMScommon = get-vm * | Sort vmname
	$GatherNetwork = $VMScommon
	$offcount = $GatherNetwork | where {$_.State -eq "Off"}
	$runningcount = $GatherNetwork | where {$_.State -eq "Running"}
			
	foreach ($Power in $GatherNetwork)
	{
	if ($Power.State -eq "Running")
	{$itemRUNNING = New-Object System.Windows.Forms.ListViewItem($Power.VMName)
	$itemRUNNING.SubItems.Add($Power.state.ToString())
	$listViewRUNNING.Items.AddRange($itemRUNNING)}
	
	if ($Power.State -eq "Off")
	{$itemSTOPPED = New-Object System.Windows.Forms.ListViewItem($Power.VMName)
	$itemSTOPPED.SubItems.Add($Power.state.ToString())
	$listViewStopped.Items.AddRange($itemSTOPPED)}
	}
	$ListboxNetwork.Items.Add($GatherNetwork.count)
	$ListboxNetwork1.Items.Add($runningcount.count)
	$ListboxNetwork2.Items.Add($offcount.count)	
}

function StartVM
{
$VMNAMEStart =  $listViewStopped.selecteditems.SubItems[0].Text;
start-vm $VMNAMEStart
RefreshVM
}

function ConnectVM
{
$VMNAMEConnect =  $listViewRunning.selecteditems.SubItems[0].Text;
$VMS1 = Get-VM -name $VMNAMEConnect
if ($vms1.NetworkAdapters.IPAddresses)
{$IPAddress = $vms1.NetworkAdapters.IPAddresses | Select –First 1 
#connect with IPAddress
Invoke-Expression ".\wfreerdp.exe /v:$IPAddress"
}
Else
{
#Get VMID for selected VM
$VMID = $VMS1.VMID
#connect with VMID
Invoke-Expression ".\wfreerdp.exe /vmconnect:$VMID /v:127.0.0.1:2179"
}}

function StopVM
{
$VMNAMEStop =  $listViewRUNNING.selecteditems.SubItems[0].Text;
stop-vm $VMNAMEStop -force
RefreshVM
}

function RefreshVM
{
	$listViewStopped.Items.Clear()
	$listViewRunning.Items.Clear()
	$ListboxNetwork.Items.Clear()
	$ListboxNetwork1.Items.Clear()
	$ListboxNetwork2.Items.Clear()
   	startHyperV
}

function Screenshot
{
	$HyperVParent = "localhost" 
	$HyperVGuest = $listViewRUNNING.selecteditems.SubItems[0].Text; 
	$xRes = 640 
	$yRes = 480
		
	$VMManagementService = Get-WmiObject -class "Msvm_VirtualSystemManagementService" -namespace "root\virtualization" -ComputerName $HyperVParent
	$Vm = Get-WmiObject -Namespace "root\virtualization" -ComputerName $HyperVParent -Query "Select * From Msvm_ComputerSystem Where ElementName='$HyperVGuest'"
	$VMSettingData = Get-WmiObject -Namespace "root\virtualization" -Query "Associators of {$Vm} Where ResultClass=Msvm_VirtualSystemSettingData AssocClass=Msvm_SettingsDefineState" -ComputerName $HyperVParent
	$RawImageData = $VMManagementService.GetVirtualSystemThumbnailImage($VMSettingData, "$xRes", "$yRes") 
	$VMThumbnail = New-Object System.Drawing.Bitmap($xRes, $yRes, [System.Drawing.Imaging.PixelFormat]::Format16bppRgb565) 
	$rectangle = New-Object System.Drawing.Rectangle(0, 0, $xRes, $yRes) 
	[System.Drawing.Imaging.BitmapData] $VMThumbnailBitmapData = $VMThumbnail.LockBits($rectangle, [System.Drawing.Imaging.ImageLockMode]::WriteOnly, [System.Drawing.Imaging.PixelFormat]::Format16bppRgb565)
	[System.Runtime.InteropServices.marshal]::Copy($RawImageData.ImageData, 0, $VMThumbnailBitmapData.Scan0, $xRes*$yRes*2)
	$VMThumbnail.UnlockBits($VMThumbnailBitmapData);
	$VMThumbnail
	$PictureBoxSS.Image = $VMThumbnail
}

#DVD listview population function
function startHyperVDVD
{
    $listViewDVD.Items.Clear()
	$VMScommon = get-vm * | Sort vmname
	Foreach ($DVD2 in $VMScommon)
	{
	if ($DVD2.dvddrives.Path -eq $Null)
    		{
       		$itemDVD = New-Object System.Windows.Forms.ListViewItem($DVD2.VMName)
		$itemDVD.SubItems.Add(“none”)
		$itemDVD.SubItems.Add(“none”)
		$listViewDVD.Items.AddRange($itemDVD)
		}
		Else
		{
		foreach($DVDvm in $DVD2.DVDDrives)
        	{
        	$itemDVD1 = New-Object System.Windows.Forms.ListViewItem($DVD2.VMName)
		$itemDVD1.SubItems.Add($DVDvm.DvdMediaType.ToString())   
		$itemDVD1.SubItems.Add($DVDvm.Path)
   		$listViewDVD.Items.AddRange($itemDVD1)
}}}}

function EJECTALL
{
	get-vmdvddrive -vmname * | set-vmdvddrive -path $null
        $listViewDVD.Items.Clear()            
        startHyperVDVD
}


function EJECT
{
$VMNAMEDVD =  $listViewDVD.selecteditems.SubItems[0].Text;
Set-VMDvdDrive -VMName "$VMNAMEDVD" -ControllerNumber 1 -ControllerLocation 0 -Path $null
       $listViewDVD.Items.Clear() 
       startHyperVDVD
}

function INSERT
{
$VMNAMEDVD =  $listViewDVD.selecteditems.SubItems[0].Text;
$DVDPATH = PromptFor-File -InitialDirectory C:\ -Type open
Set-VMDvdDrive -VMName "$VMNAMEDVD" -ControllerNumber 1 -ControllerLocation 0 -Path "$DVDPATH"
        $listViewDVD.Items.Clear() 
        startHyperVDVD
}

function TOOLS
{
$VMNAMEDVD =  $listViewDVD.selecteditems.SubItems[0].Text;
Set-VMDvdDrive -VMName "$VMNAMEDVD" -ControllerNumber 1 -ControllerLocation 0 -Path "C:\Windows\system32\vmguest.iso"
        $listViewDVD.Items.Clear()
        startHyperVDVD
}


# Rename remove listview population function
function startHyperVRR
{
        $listViewRR.Items.Clear()
	$objTextBox.Clear()
	$VMScommon = get-vm * | Sort vmname
	Foreach ($RR2 in $VMScommon)
	{
	$itemRR = New-Object System.Windows.Forms.ListViewItem($RR2.VMName)
	$listViewRR.Items.AddRange($itemRR)
}}

function RRSave
{
$VMNAMERR = $listViewRR.selecteditems.SubItems[0].Text;
$vhost = get-vmhost 
$PATHVM = ($vhost.virtualmachinepath)
Stop-vm "$VMNAMERR" -Force
Remove-VM "$VMNAMERR" -Force
startHyperVRR
done
}

function RRDelete
{
$VMNAMERR = $listViewRR.selecteditems.SubItems[0].Text;
$vhost = get-vmhost 
$PATHVM = ($vhost.virtualmachinepath)
Stop-vm "$VMNAMERR" -Force
Remove-VM "$VMNAMERR" -Force
Remove-item $PATHVM\$VMNAMERR -recurse
startHyperVRR
done
}

function ReNameVM1
{
$VMNAMERR = $listViewRR.selecteditems.SubItems[0].Text;
$NewName = $objTextBox.Text
Rename-VM "$VMNAMERR" –NewName $Newname
startHyperVRR
}

# Ram vCPU populate listview function
function StartRMAvCPU
{
	$listViewRC.Items.Clear()
	$DropDownBox1.resettext()
	$RAMBOX.Clear()
	$vCPUBox.Clear()
	$VMScommon = get-vm * | Sort vmname
	Foreach ($RC2 in $VMScommon)
	{
        $RAMAssigned1 = [math]::round($RC2.Memoryassigned/1GB)
	$itemRC = New-Object System.Windows.Forms.ListViewItem($RC2.VMName)        
        if ($RC2.Memoryassigned -eq 0)
         {$MEM = "Off"
        	$itemRC.SubItems.Add($MEM)}
        else {$itemRC.SubItems.Add($RAMAssigned1)}
	$itemRC.SubItems.Add($RC2.processorCount)
	$listViewRC.Items.AddRange($itemRC)
}}


function ChangeRAMvCPU
{
 $NAME_RVCPU = $listViewRC.selecteditems.SubItems[0].Text;
 $newRAM = [int64]$RAMBOX.Text * 1073741824
 $newvCPU = $vCPUBox.Text

 if ($newRAM -eq $null-and $newvCPU -eq $null)
 {}

 if ($newRAM -ne $null -and $newvCPU -ne $null) 
 {
 stop-vm $NAME_RVCPU -force
 Set-vm -name $NAME_RVCPU –MemoryStartupBytes $newRAM
 Set-VMProcessor $NAME_RVCPU -Count $newvCPU
 StartorStop
 }

 if ($newRAM -ne $null -and $newvCPU -eq $null) 
 {
 stop-vm $NAME_RVCPU -force
 Set-vm -name $NAME_RVCPU –MemoryStartupBytes $newRAM
 StartorStop
 }

 if ($newRAM -eq $null -and $newvCPU -ne $null) 
 {
 stop-vm $NAME_RVCPU -force
 Set-VMProcessor $NAME_RVCPU -Count $newvCPU
 StartorStop
}}

function StartorStop
{
$startLoFF = $DropDownBox1.SelectedItem
if($startLoFF -eq "Start VM")
{start-vm $NAME_RVCPU}
else {}
StartRMAvCPU
}

#main screen and summary screen population function
function displayinfo
{
$SplitContainer1.Panel2.Controls.Add($frmINFO)
$frmINFO = [System.Windows.Forms.DockStyle]::Fill
$Result = get-info | out-string;
$outputBox.text = $Result
} 
  
function get-info {
$VMScommon = get-vm * | Sort vmname
$offcount = $VMScommon | where {$_.State -eq "Off"}
$runningcount = $VMScommon | where {$_.State -eq "Running"}
$computers = $Env:COMPUTERNAME
echo "Total number of VM's on server" 
echo "------------------------------" 
$VMScommon.Count 
echo " "
echo "Number of VM's Running on server" 
echo "------------------------------" 
$runningcount.count 
echo " "
echo "Number of VM's Off on server" 
echo "------------------------------" 
$offcount.count 
echo " " 
# get the vhost uptime
Get-CimInstance Win32_OperatingSystem -comp $computers | Select @{Name="VHostName";Expression={$_."csname"}},@{Name="UPTIME=D.H:M:S.Milliseconds";Expression={(Get-Date) - $_.LastBootUpTime}},LastBootUpTime | format-table -autosize
# get the vhost name, total virtual CPU count, total RAM, virtualharddiskpath and virtualmachinepath
Get-VMHost | Select @{Name="VHostName";Expression={$_."Name"}},@{N="Total RAM(GB)";E={""+ [math]::round($_.Memorycapacity/1GB)}},logicalprocessorcount | format-table -autosize
Get-VMHost | Select virtualharddiskpath,virtualmachinepath | format-table -autosize
echo "VHOST Server IP Addresses and NIC's"
Get-WMIObject win32_NetworkAdapterConfiguration |   Where-Object { $_.IPEnabled -eq $true } | Select IPAddress,Description | format-table -autosize
echo "VHOST Server  Disk Space" 
# to get D: drive add ,D after C  - E: drive ,E etc.
Get-psdrive C,D | Select Root,@{N="Total(GB)";E={""+ [math]::round(($_.free+$_.used)/1GB)}},@{N="Used(GB)";E={""+ [math]::round($_.used/1GB)}},@{N="Free(GB)";E={""+ [math]::round($_.free/1GB)}} |format-table -autosize
echo "VHosts virtual switch(s) information" 
get-vmswitch * 
} 

function display-info {
 $Result1 = get-info1 | out-string;
 $outputBox1.text=$Result1
} 
  
function get-info1 {
 Get-VMHost | Select virtualharddiskpath,virtualmachinepath | format-table -autosize
 echo "Listing of your NIC's and IP addresses"
 Get-NetIPAddress | Where-Object {$_.ipaddress -like "*.*.*.*"} | select interfacealias, ipaddress | format-table -autosize
 echo "VHosts virtual switch(s) information" 
 echo "If there are no vSwitches shown, you have none built."
 get-vmswitch * 
} 

function newpathsOK {
Set-VMHost -virtualHardDiskPath $VHOSTmgrTextbox1.Text -virtualMachinePath $VHOSTmgrTextbox2.Text
display-info
$VHOSTmgrTextbox1.Clear()
$VHOSTmgrTextbox2.Clear()
}

function newVSWITCH {PBAR
New-VMSwitch -Name $newSNtextBox.text -NetAdapterName $switchnewDropDownBox.SelectedItem -AllowManagementOS $True
display-info
$newSNtextBox.Clear()
$switchnewDropDownBox.resettext()
done
}

function removeVSWITCH {PBAR
Remove-VMSwitch $vswitchremoveDropDownBox.SelectedItem -force
display-info
$vswitchremoveDropDownBox.resettext()
done
}

function clearform{
$NEWvmNEWvhdTextBox.Clear()
$NEWvmNEWvhdTextBox1.Clear()
$NEWvmNEWvhdTextBox2.Clear()
$NEWvmNEWvhdTextBox3.Clear()
$NEWvmNEWvhdTextBox4.Clear()
$NEWvmNEWvhdDropDownBox.resettext()
$RadioButton1.Checked = $false
$RadioButton2.Checked = $false
$NEWvmNEWvhdDropDownBox1.resettext()
}

Function MakeNewVM-NewDisk {
$VPATH = get-vmhost
$NAME = $NEWvmNEWvhdTextBox.Text 
$RAM = [int64]$NEWvmNEWvhdTextBox1.Text * 1073741824
$vCPU = $NEWvmNEWvhdTextBox2.Text
$newVHDsize = [int64]$NEWvmNEWvhdTextBox3.Text * 1073741824
$DiskPATH = $NEWvmNEWvhdTextBox6.Text
$PATHDVD = $NEWvmNEWvhdTextBox4.Text
$vSwitch1 = $NEWvmNEWvhdDropDownBox.SelectedItem
$startLoFF = $NEWvmNEWvhdDropDownBox1.SelectedItem
$Name1 = $Name
$1 = "\"
$2 = ".vhdx"
$3 = "\"
$PATHVM1 = ($VPATH.virtualmachinepath)
$PATHVM = ($PATHVM1 += $1 += $NAME)
$newVHDPATH1 = ($VPATH.virtualharddiskpath)
$newVHDPATH = ($newVHDPATH1 += $1 += $3 +=$NAME1 += $2)

if ($RadioButton1.Checked -eq $true)
{PBAR
New-VHD -Fixed -Path $newVHDPATH -SizeBytes $newVHDsize}

elseif ($RadioButton2.Checked -eq $true)
{PBAR
New-VHD -Path $newVHDPATH -SizeBytes $newVHDsize}

#create VM
NEW-VM –Name $NAME –MemoryStartupBytes $RAM -Path $PATHVM 
Add-VMHardDiskDrive -VMName $NAME -Path $newVHDPATH
Set-VMProcessor $NAME -Count $vCPU
get-vmnetworkadapter -vmname $NAME | connect-vmnetworkadapter -switchname $vSwitch1
Set-VMBios $NAME -EnableNumlock
Set-VMDvdDrive -VMName $NAME -ControllerNumber 1 -ControllerLocation 0 –Path $PATHDVD

if($startLoFF -eq "Start VM")
{start-vm "$Name"
done}

else {done}
}

function clearform-frmNewVMeVHD {
$NewVMeVHDTextBox.Clear()
$NewVMeVHDTextBox1.Clear()
$NewVMeVHDTextBox2.Clear()
$NewVMeVHDTextBox6.Clear()
$NewVMeVHDDropDownBox.resettext()
$NewVMeVHDDropDownBox1.resettext()
}

Function MakeNewVMeVHD-oldDisk {
PBAR
$VPATH = get-vmhost
$NAME = $NewVMeVHDTextBox.Text 
$RAM = [int64]$NewVMeVHDTextBox1.Text * 1073741824
$vCPU = $NewVMeVHDTextBox2.Text
$DiskPATH = $NewVMeVHDTextBox6.Text
$vSwitch1 = $NewVMeVHDDropDownBox.SelectedItem
$startLoFF = $NewVMeVHDDropDownBox1.SelectedItem
$Name1 = $Name
$1 = "\"
$PATHVM1 = ($VPATH.virtualmachinepath)
$PATHVM = ($PATHVM1 += $1 += $NAME1)

#create VM with existing vhdx disk
NEW-VM -Name $NAME -MemoryStartupBytes $RAM -Path $PATHVM
Add-VMHardDiskDrive -VMName $NAME -Path $DiskPATH
Set-VMProcessor $NAME -Count $vCPU
get-vmnetworkadapter -vmname $NAME | connect-vmnetworkadapter -switchname $vSwitch1
Set-VMBios $NAME -EnableNumlock

if($startLoFF -eq "Start VM")
{start-vm "$Name"
done}

else {done}
}

# create attach new VHDX to VM population fuction
function LoadVMs
{
$listViewNEWVHD.Items.Clear()
$VMScommon = get-vm * | Sort vmname
foreach($vm44 in $VMScommon)
{
    if ($vm44.HardDrives.Count -eq 0)
    {
    $itemNVHD = New-Object System.Windows.Forms.ListViewItem($vm44.VMName)
	$itemNVHD.SubItems.Add(“none”)
	$listViewNEWVHD.Items.AddRange($itemNVHD)
    }
    else
    {
        foreach($hd in $vm44.HardDrives)
        {
        $itemNVHD1 = New-Object System.Windows.Forms.ListViewItem($vm44.VMName)
		$itemNVHD1.SubItems.Add($hd.Path)
		$listViewNEWVHD.Items.AddRange($itemNVHD1)
}}}}

function clearform6 {
$NEWVHDxTextBox2.Clear()
$NEWVHDxTextBox3.Clear()
$NEWVHDxDropDownBox4.resettext()
$NEWVHDxTextbox1.Clear()
$NEWVHDxDropDownBox1.resettext()
LoadVMs
}

Function MakeNewVDX{
$VMNAME =  $listViewNEWVHD.selecteditems.SubItems[0].Text;
$Fname = $NEWVHDxTextBox2.text 
$newVHDsize = [int64]$NEWVHDxTextBox3.text * 1073741824
$ForD = $NEWVHDxDropDownBox4.SelectedItem
$DiskPATH = $NEWVHDxTextbox1.text
$startLoFF = $DropDownBox1.SelectedItem

if($ForD -eq "Fixed")
{PBAR
Stop-vm $VMNAME -force
New-VHD -Fixed -Path $DiskPATH\$Fname -SizeBytes $newVHDsize
Add-VMHardDiskDrive -VMName $VMNAME -Path $DiskPATH\$Fname
}
elseif ($ForD -eq "Differencing")
{PBAR
Stop-vm $VMNAME -force
New-VHD -Path $DiskPATH\$Fname -SizeBytes $newVHDsize
Add-VMHardDiskDrive -VMName $VMNAME -Path $DiskPATH\$Fname
}
if($startLoFF -eq "Start VM")
{start-vm "$VMName"
clearform6
done
}
else {clearform6
done}
}

#Add remove VHD list box population function
function LoadVM1s
{
	$listViewExistVHD.Items.clear()
	$VMScommon = get-vm * | Sort vmname
	foreach($vm555 in $VMScommon)
	{
    		if ($vm555.HardDrives.Count -eq 0)
    		{
       		$itemARVHD = New-Object System.Windows.Forms.ListViewItem($vm555.VMName)
		$itemARVHD.SubItems.Add(“none”)
		$itemARVHD.SubItems.Add(“none”)
		$itemARVHD.SubItems.Add(“none”)
		$itemARVHD.SubItems.Add(“none”)
		$listViewExistVHD.Items.AddRange($itemARVHD)
    		}
    		else
    		{
       		foreach($hd1 in $vm555.HardDrives)
        	{
                $itemARVHD1 = New-Object System.Windows.Forms.ListViewItem($vm555.VMName)
		$itemARVHD1.SubItems.Add($hd1.ControllerType.ToString())   
		$itemARVHD1.SubItems.Add($hd1.ControllerNumber)
		$itemARVHD1.SubItems.Add($hd1.ControllerLocation)
		$itemARVHD1.SubItems.Add($hd1.Path)
   		$listViewExistVHD.Items.AddRange($itemARVHD1)
}}}}


function clearform7 {
$ExistVHDTextbox1.Clear()
$RadioButton11.Checked = $false
$RadioButton22.Checked = $false
$ExistVHDDropDownBox1.resettext()
$ExistVHDDropDownBox5.resettext()
$ExistVHDDropDownBox6.resettext()
LoadVM1s
}

Function AddeVHDvm{
$VMNAME11 = $listViewExistVHD.selecteditems.SubItems[0].Text; 
$DiskPATH11 = $ExistVHDTextbox1.text
$startLoFF11 = $DropDownBox1.SelectedItem
PBAR
Stop-vm $VMNAME11 -force
if ($RadioButton11.Checked -eq $true)
{Add-VMHardDiskDrive -VMName $VMNAME11 -Path $DiskPATH11}

if($startLoFF11 -eq "Start VM")
{start-vm "$VMName11"
clearform7
done
}
else {clearform7
done}
}

Function removeVMvm{
$VMNAME = $listViewExistVHD.selecteditems.SubItems[0].Text; 
$CT = $listViewExistVHD.selecteditems.SubItems[1].Text;
$CN = $listViewExistVHD.selecteditems.SubItems[2].Text;
$CL = $listViewExistVHD.selecteditems.SubItems[3].Text;
$FPATH = $listViewExistVHD.selecteditems.SubItems[4].text;
$DiskPATH = $ExistVHDTextbox1.text
$startLoFF = $DropDownBox1.SelectedItem
$startLoFF1 = $DropDownBox5.SelectedItem
Stop-vm $VMNAME -force
	if ($RadioButton22.Checked -eq $true)
{PBAR
Remove-VMHardDiskDrive -VMName $VMNAME –ControllerType $CT -ControllerNumber $CN -ControllerLocation $CL}
	if ($ExistVHDDropDownBox6.SelectedItem -eq "Delete")
{PBAR
remove-item $FPATH -recurse}
	if($startLoFF1 -eq "Start VM")
{start-vm "$VMName"
clearform7
done
}
	else {clearform7
done}
}

#Export listview population function
function startEXPORT
{
        $listViewExport.Items.Clear()
	$ExportTextbox1.Clear()
	$VMScommon = get-vm * | Sort vmname
	Foreach ($Export2 in $VMScommon)
	{
		$itemEX1 = New-Object System.Windows.Forms.ListViewItem($EXPORT2.VMname)
		$itemEX1.SubItems.Add($EXPORT2.State.ToString())
		$listViewExport.Items.AddRange($itemEX1)  
        }
}

function ExportVM1
{PBAR
$VMNAMEex1 = $listViewExport.selecteditems.SubItems[0].Text;
stop-vm "$VMNAMEex1" -force
Export-vm -Name "$VMNAMEex1" -Path $ExportTextbox1.text
start-vm "$VMNAMEex1"
startEXPORT
Done
}

function ImportVM
{
if ($RadioButton1i.Checked -eq $true)
{PBAR
Import-VM -Path $ImportTextbox1.text -VhdDestinationPath $ImportTextbox2.text -VirtualMachinePath $ImportTextbox2.text –Copy -SnapshotFilePath $ImportTextbox2.text -SmartPagingFilePath $ImportTextbox2.text
}
elseif ($RadioButton2i.Checked -eq $true)
{PBAR
Import-VM -Path $ImportTextbox1.text -VhdDestinationPath $ImportTextbox2.text -VirtualMachinePath $ImportTextbox2.text –Copy -GenerateNewId -SnapshotFilePath $ImportTextbox2.text -SmartPagingFilePath $ImportTextbox2.text
}
Done
}

function LoadVMnw1
{
                $listViewVMnw.Items.clear()
		$VMScommon = get-vm * | Sort vmname
                Foreach ($Active54 in $VMScommon)
                {if ($Active54.NetworkAdapters.switchname -eq $null)
                                {
                                $itemNW = New-Object System.Windows.Forms.ListViewItem($Active54.VMName)
                                $itemNW.SubItems.Add("none")
					if ($Active54.NetworkAdapters.name -eq $null)
                                	{$itemNW.SubItems.Add("none")} 
					else
					{$itemNW.SubItems.Add($Active54.NetworkAdapters.name)}
                                $listViewVMnw.Items.AddRange($itemNW)
                                }		                           
				else
                                {
                                foreach($FXZ in $Active54.NetworkAdapters)
                                {
                                $itemNW1 = New-Object System.Windows.Forms.ListViewItem($Active54.VMName)
				$itemNW1.SubItems.Add($FXZ.Switchname)
                                $itemNW1.SubItems.Add($FXZ.name)
                                $listViewVMnw.Items.AddRange($itemNW1)
}}}}

function clearform7nw {
$VMnwDropDownBox1.resettext()
$NEWnicTextBox.clear()
$VMnwDropDownBox2.resettext()
LoadVMnw1
done
}

Function MoveAddvswitch{
$VMNAMEnw1 = $listViewVMnw.selecteditems.SubItems[0].Text;
$NICnw1 = $listViewVMnw.selecteditems.SubItems[2].Text;
$vSwitchnw1 = $VMnwDropDownBox1.selecteditem
Connect-VMNetworkAdapter -VMName $VMNAMEnw1 -Name $NICnw1 -SwitchName $vSwitchnw1
clearform7nw
LoadVMnw1
}

Function Unplugvswitch{
$VMNAMEnw1 = $listViewVMnw.selecteditems.SubItems[0].Text;
$vSwitchnw1 = $listViewVMnw.selecteditems.SubItems[1].Text;
$NICnw1 = $listViewVMnw.selecteditems.SubItems[2].Text;
Get-VMNetworkAdapter -VMName $VMNAMEnw1 | Where-Object {$_.switchName -eq $vSwitchnw1 -and $_.Name -eq $NICnw1 } | Disconnect-VMNetworkAdapter
clearform7nw
LoadVMnw1
}

Function AddnicNEW{
$VMNAMEnw1 = $listViewVMnw.selecteditems.SubItems[0].Text;
$NewNICnw1 = $NEWnicTextBox.text
$vSwitchnw3 = $VMnwDropDownBox2.selecteditem
stop-vm $VMNAMEnw1 -force
Add-VMNetworkAdapter –VMName "$VMNAMEnw1" –Name "$NewNICnw1" -SwitchName "$vSwitchnw3"
clearform7nw
LoadVMnw1
}

Function RemoveNICvm{
$VMNAMEnw1 = $listViewVMnw.selecteditems.SubItems[0].Text;
$NICnw1 = $listViewVMnw.selecteditems.SubItems[2].Text;
stop-vm $VMNAMEnw1 -force
Remove-VMNetworkAdapter -vmname "$VMNAMEnw1" -VMNetworkAdapterName "$NICnw1"
clearform7nw
LoadVMnw1
}

#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
#VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

Add-Type '
using System;
using System.Runtime.InteropServices;
using System.Text;
public class BrowseForFolder
    {
        // Constants for sending and receiving messages in BrowseCallBackProc
        public const int WM_USER = 0x400;
        public const int BFFM_INITIALIZED = 1;
        public const int BFFM_SELCHANGED = 2;
        public const int BFFM_VALIDATEFAILEDA = 3;
        public const int BFFM_VALIDATEFAILEDW = 4;
        public const int BFFM_IUNKNOWN = 5; // provides IUnknown to client. lParam: IUnknown*
        public const int BFFM_SETSTATUSTEXTA = WM_USER + 100;
        public const int BFFM_ENABLEOK = WM_USER + 101;
        public const int BFFM_SETSELECTIONA = WM_USER + 102;
        public const int BFFM_SETSELECTIONW = WM_USER + 103;
        public const int BFFM_SETSTATUSTEXTW = WM_USER + 104;
        public const int BFFM_SETOKTEXT = WM_USER + 105; // Unicode only
        public const int BFFM_SETEXPANDED = WM_USER + 106; // Unicode only

        // Browsing for directory.
        private uint BIF_RETURNONLYFSDIRS   = 0x0001;  // For finding a folder to start document searching
        private uint BIF_DONTGOBELOWDOMAIN  = 0x0002;  // For starting the Find Computer
        private uint BIF_STATUSTEXT     = 0x0004;  // Top of the dialog has 2 lines of text for BROWSEINFO.lpszTitle and one line if
        // this flag is set.  Passing the message BFFM_SETSTATUSTEXTA to the hwnd can set the
        // rest of the text.  This is not used with BIF_USENEWUI and BROWSEINFO.lpszTitle gets
        // all three lines of text.
        private uint BIF_RETURNFSANCESTORS  = 0x0008;
        private uint BIF_EDITBOX        = 0x0010;   // Add an editbox to the dialog
        private uint BIF_VALIDATE       = 0x0020;   // insist on valid result (or CANCEL)

        private uint BIF_NEWDIALOGSTYLE     = 0x0040;   // Use the new dialog layout with the ability to resize
        // Caller needs to call OleInitialize() before using this API
        private uint BIF_USENEWUI  = 0x0040 + 0x0010; //(BIF_NEWDIALOGSTYLE | BIF_EDITBOX);

        private uint BIF_BROWSEINCLUDEURLS  = 0x0080;   // Allow URLs to be displayed or entered. (Requires BIF_USENEWUI)
        private uint BIF_UAHINT         = 0x0100;   // Add a UA hint to the dialog, in place of the edit box. May not be combined with BIF_EDITBOX
        private uint BIF_NONEWFOLDERBUTTON  = 0x0200;   // Do not add the "New Folder" button to the dialog.  Only applicable with BIF_NEWDIALOGSTYLE.
        private uint BIF_NOTRANSLATETARGETS = 0x0400;  // dont traverse target as shortcut

        private uint BIF_BROWSEFORCOMPUTER  = 0x1000;  // Browsing for Computers.
        private uint BIF_BROWSEFORPRINTER   = 0x2000;// Browsing for Printers
        private uint BIF_BROWSEINCLUDEFILES = 0x4000; // Browsing for Everything
        private uint BIF_SHAREABLE      = 0x8000;  // sharable resources displayed (remote shares, requires BIF_USENEWUI)

        [DllImport("shell32.dll")]
        static extern IntPtr SHBrowseForFolder(ref BROWSEINFO lpbi);

          // Note that the BROWSEINFO objects pszDisplayName only gives you the name of the folder.
        // To get the actual path, you need to parse the returned PIDL
        [DllImport("shell32.dll", CharSet=CharSet.Unicode)]
        // static extern uint SHGetPathFromIDList(IntPtr pidl, [MarshalAs(UnmanagedType.LPWStr)] 
        //StringBuilder pszPath);
        static extern bool SHGetPathFromIDList(IntPtr pidl, IntPtr pszPath);

        [DllImport("user32.dll", PreserveSig = true)]
        public static extern IntPtr SendMessage(HandleRef hWnd, uint Msg, int wParam, IntPtr lParam);

        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern IntPtr SendMessage(HandleRef hWnd, int msg, int wParam, string lParam);

        private string _initialPath;

        public delegate int BrowseCallBackProc(IntPtr hwnd, int msg, IntPtr lp, IntPtr wp);
        struct BROWSEINFO 
        {
            public IntPtr hwndOwner;
            public IntPtr pidlRoot;
            public string pszDisplayName;
            public string lpszTitle;
            public uint ulFlags;
            public BrowseCallBackProc lpfn;
            public IntPtr lParam;
            public int iImage;
        }
        public int OnBrowseEvent(IntPtr hWnd, int msg, IntPtr lp, IntPtr lpData)
        {
            switch(msg)
            {
            case BFFM_INITIALIZED: // Required to set initialPath
            {
                //Win32.SendMessage(new HandleRef(null, hWnd), BFFM_SETSELECTIONA, 1, lpData);
                // Use BFFM_SETSELECTIONW if passing a Unicode string, i.e. native CLR Strings.
                SendMessage(new HandleRef(null, hWnd), BFFM_SETSELECTIONW, 1, _initialPath);
                break;
            }
            case BFFM_SELCHANGED:
            {
                IntPtr pathPtr = Marshal.AllocHGlobal((int)(260 * Marshal.SystemDefaultCharSize));
                if (SHGetPathFromIDList(lp, pathPtr))
                SendMessage(new HandleRef(null, hWnd), BFFM_SETSTATUSTEXTW, 0, pathPtr);
                Marshal.FreeHGlobal(pathPtr);
                break;
            }
            }

            return 0;
        }

        public string SelectFolder(string caption, string initialPath, IntPtr parentHandle)
        {
            _initialPath = initialPath;
            StringBuilder sb = new StringBuilder(256);
            IntPtr bufferAddress = Marshal.AllocHGlobal(256); ;
            IntPtr pidl = IntPtr.Zero;
            BROWSEINFO bi = new BROWSEINFO();
            bi.hwndOwner = parentHandle;
            bi.pidlRoot = IntPtr.Zero;
            bi.lpszTitle = caption;
            bi.ulFlags =  BIF_SHAREABLE;
            bi.lpfn = new BrowseCallBackProc(OnBrowseEvent);
            bi.lParam = IntPtr.Zero;
            bi.iImage = 0;

            try
            {
                pidl = SHBrowseForFolder(ref bi);
                if (true != SHGetPathFromIDList(pidl, bufferAddress))
                {
                    return null;
                }
                sb.Append(Marshal.PtrToStringAuto(bufferAddress));
            }
            finally
            {
                // Caller is responsible for freeing this memory.
                Marshal.FreeCoTaskMem(pidl);
            }

            return sb.ToString();
        }
    }
' -IgnoreWarnings
$Browser = New-Object -TypeName BrowseForFolder

function PromptFor-File
{
    param
    (   
        [String] $Type = "Open",
        [String] $Title = "Select File",
        [String] $Filename = $null,
        [String[]] $FileTypes,
        [switch] $RestoreDirectory,
        [IO.DirectoryInfo] $InitialDirectory = $null
    )
     
    [void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
     
    if ($FileTypes)
    {
        $FileTypes | % {
            $filter += $_.ToUpper() + " Files|*.$_|"
        }
        $filter = $filter.TrimEnd("|")
    }
    else
    {
        $filter = "All Files|*.*"
    }
     
    switch ($Type)
    {
        "Open"
        {
            $dialog = New-Object System.Windows.Forms.OpenFileDialog
            $dialog.Multiselect = $false
        }
        "Save"
        {
            $dialog = New-Object System.Windows.Forms.SaveFileDialog
        }
    }
     
    $dialog.FileName = $Filename
    $dialog.Title = $Title
    $dialog.Filter = $filter
    $dialog.RestoreDirectory = $RestoreDirectory
    $dialog.InitialDirectory = $InitialDirectory.Fullname
    $dialog.ShowHelp = $true
     
    if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK)
    {
       $dialog.FileName
    }
    else
    {
       return $null
    }
}

function done{
$GPBAR1 = Get-process PBarstart
If ($GPBAR1.ProcessName -eq "PBarstart")
{
$Shell1 = New-Object -Comobject("WScript.Shell")
$ReadmePath2 = Join-Path (Get-ScriptDirectory) "PBarstop.exe PBarstart"
$Temp1 = $ReadmePath2
$Shell1.Run($Temp1)
}

$frmDone = New-object System.Windows.Forms.Form 
$frmDone.Text = "Done"
$frmDone.Size = New-object System.Drawing.Size(100,100) 
$frmDone.StartPosition = "CenterScreen"
$frmDone.KeyPreview = $True
$frmDone.ControlBox = $false
$frmDone.MaximizeBox = $false
$frmDone.MinimizeBox = $false
$frmDone.ShowIcon = $false
$frmDone.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$frmDone.Close()}})
$OKButtonDONE = New-object System.Windows.Forms.Button
$OKButtonDONE.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButtonDONE.Location = New-object System.Drawing.Size(25,25)
$OKButtonDONE.Size = New-object System.Drawing.Size(75,23)
$OKButtonDONE.Text = "Done"
$OKButtonDONE.Add_Click({$frmDone.Close()})
$frmDone.Controls.Add($OKButtonDONE)
$frmDone.ShowDialog()
}

Function PBAR{
$Shell = New-Object -Comobject("WScript.Shell")
$ReadmePath1 = Join-Path (Get-ScriptDirectory) "PBarstart.exe"
$Temp = $ReadmePath1
$Shell.Run($Temp)}

function MenuAbout
{
$frmABOUT = New-Object System.Windows.Forms.Form 
$frmABOUT.Text = "About"
$frmABOUT.Size = New-Object System.Drawing.Size(500,250) 
$frmABOUT.StartPosition = "CenterScreen"
$frmABOUT.KeyPreview = $True
$frmABOUT.ControlBox = $false
$frmABOUT.MaximizeBox = $false
$frmABOUT.MinimizeBox = $false
$frmABOUT.ShowIcon = $false
$frmABOUT.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$frmABOUT.Close()}})

$AboutLabel = New-Object System.Windows.Forms.Label
$AboutLabel.Location = New-Object System.Drawing.Point(10, 10)
$AboutLabel.Size = New-Object System.Drawing.Size(280, 20)
$AboutLabel.Font = New-Object System.Drawing.Font("Tahoma", 8.25, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point,([System.Byte] ( 0 ) ))
$AboutLabel.Text = "PSHVM 3.0 (Powershell Hyper-V Manager)"
$frmABOUT.Controls.Add($AboutLabel)

$AboutLabel1 = New-Object System.Windows.Forms.Label
$AboutLabel1.Location = New-Object System.Drawing.Point(10,40)
$AboutLabel1.Size = New-Object System.Drawing.Size(482, 20)
$AboutLabel1.Text = "Written by James Stephan: ... Stephanco.blogspot.com or PSHVM.codeplex.com"
$frmABOUT.Controls.Add($AboutLabel1)

$AboutLabel2 = New-Object System.Windows.Forms.Label
$AboutLabel2.Location = New-Object System.Drawing.Point(10,70)
$AboutLabel2.Size = New-Object System.Drawing.Size(280, 20)
$AboutLabel2.Text = "Email: PSHMV2013-new@yahoo.com."
$frmABOUT.Controls.Add($AboutLabel2)

$AboutLabel3 = New-Object System.Windows.Forms.Label
$AboutLabel3.Location = New-Object System.Drawing.Point(10,100)
$AboutLabel3.Size = New-Object System.Drawing.Size(482, 20)
$AboutLabel3.Text = "A VERY BIG - THANK YOU to Adam Driscoll."
$frmABOUT.Controls.Add($AboutLabel3)

$AboutLabel4 = New-Object System.Windows.Forms.Label
$AboutLabel4.Location = New-Object System.Drawing.Point(10,130)
$AboutLabel4.Size = New-Object System.Drawing.Size(482, 20)
$AboutLabel4.Text = "Thanks to Corefig.codeplex.com team for base forms code and some modules."
$frmABOUT.Controls.Add($AboutLabel4)

$OKButtonABOUT = New-Object System.Windows.Forms.Button
$OKButtonABOUT.FlatStyle = [System.Windows.Forms.FlatStyle]::System
$OKButtonABOUT.Location = New-Object System.Drawing.Size(10,175)
$OKButtonABOUT.Size = New-Object System.Drawing.Size(75,23)
$OKButtonABOUT.Text = "Close"
$OKButtonABOUT.Add_Click({$frmABOUT.Close()})
$frmABOUT.Controls.Add($OKButtonABOUT)
$frmABOUT.ShowDialog()
}

function MenuTaskMgr
{
	$Shell = New-Object -Comobject("WScript.Shell")
	$Temp = "Taskmgr.exe"
	$Shell.Run($Temp)
}

function MenuSystem
{
	$Shell = New-Object -Comobject("WScript.Shell")
	$Temp = "msinfo32.exe"
	$Shell.Run($Temp)
}

function MenuRegistry
{
	$Shell = New-Object -Comobject("WScript.Shell")
	$Temp = "Regedt32.exe"
	$Shell.Run($Temp)
}

function MenuCMD
{
	$Shell = New-Object -Comobject("WScript.Shell")
	$Temp = "cmd.exe"
	$Shell.Run($Temp)
}

function menuEventvwr
{
	$Shell = New-Object -Comobject("WScript.Shell")
	$Temp = ".\MyEventViewer.exe"
	$Shell.Run($Temp)
}

function menuServices
{
	Start-Process PowerShell.exe –ArgumentList "-WindowStyle Hidden .\services.ps1"
}

function menuFirewall
{
	Start-Process PowerShell.exe –ArgumentList "-WindowStyle Hidden .\firewallsettings.ps1"
}

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

Main

#endregion