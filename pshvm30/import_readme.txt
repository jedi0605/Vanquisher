**** README ***** README ***** README **** README ****

This very important you will need to complete these steps before going back to the Import program and clicking
the "Import VM" button:

Directly behind this import_readme - Notepad is the XML file you just specified in the first browse box.
You will need to access it and then in the menu bar click Edit\Find
Copy and paste this line into the Find input box <last_state_change_time type="integer">
Once it finds the search string, click Cancel to close the Find box
Now you will edit this string (Example  <name type="string">test2</name>) it is located the next line down from
the search string.

(search string)<last_state_change_time type="integer">130196882110784351</last_state_change_time>
(edit String)    <name type="string">test2</name>

Change the value between <name type="string"></name> in this case test2 to whatever you want to call the imported server in hyperv

File\Save *.xml file
File\Exit both this readme file and the *.xml file
Proceed to click the "Import VM" button

Your VM will be Imported with a new VMID as the name you just specified in the *.xml file.

DONE

