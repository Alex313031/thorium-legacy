## progwrp.dll

This is a wrapper Dynamic Link Library made by the well respected [@win32ss](https://win32subsystem.live/) (also the creator of the [Windows Vista Extended Kernel](https://win32subsystem.live/extended-kernel/)).

The name means "Program Wrapper", and progwrp enables programs such as Chromium and Electron to run on Windows versions before 7 RTM (6.1.7600).

It is used when linking the program, and win32 API functions that are not supported on pre-win7 versions are instead redirected to this .dll.
The .dll contains custom implementations of these functions, written in C & C++, "translating" them into something that older Windows can understand.
While this does introduce a little bit of overhead, it simplifies development greatly, and the fact *that we have Chromium M122 working on Windows XP at all* is a godsend for legacy software/hardware enthusiasts.

progwrp is currently used in the [Supermium Web Browser](https://win32subsystem.live/supermium/), to provide an up to date Chromium-based web browser for legacy Windows versions. It is also used here, in [Thorium-Legacy](https://github.com/Alex313031/Thorium-win7), for the same purpose.

### Supported Windows Versions

Currently supported Windows versions are:

 - Windows XP x86 (5.1.2600)
 - Windows XP x64 (5.2.3790)

 - Windows Server 2003 x86 (5.2.3790)
 - Windows Server 2003 x64 (5.2.3790)
 - Windows Server 2003 R2 x86 (5.2.3790)
 - Windows Server 2003 R2 x64 (5.2.3790)

 - Windows Vista x86 (6.0.6003)
 - Windows Vista x64 (6.0.6003)
 - Windows Server 2008 x86 (6.0.6003)
 - Windows Server 2008 x64 (6.0.6003)

Work in progress support for:

 - Windows 2000 x86 (5.00.2195)

 - Windows 2000 Server x86 (5.00.2195)
 - Windows 2000 Datacenter x86 (5.00.2195)

Note: The latest service pack for these OSes should be applied before trying to run a program compiled with progwrp.dll.

For XP x86, this is [SP3](https://www.catalog.update.microsoft.com/Search.aspx?q=KB936929).  
For XP x64 and Server 2003, this is [SP2](https://www.catalog.update.microsoft.com/Search.aspx?q=KB914961).  
For Vista and Server 2008, this is [SP2](https://www.catalog.update.microsoft.com/Search.aspx?q=KB948465).  
For 2000, this is [SP4](http://www.download.windowsupdate.com/msdownload/update/v3-19990518/cabpool/w2ksp4_en_7f12d2da3d7c5b6a62ec4fde9a4b1e6.exe).

Windows 7 SP1 (6.1.7601), Windows 8/Server 2012 (6.2.9200), and Windows Server 8.1/Server 2012 R2 (6.3.9600) do not require or benefit from progwrp.dll. Windows 10 and 11 are not really supported by either Supermium or Thorium-Win7, and why would you run these on those OSes anyway?

### Dev Usage

To use this library, one must include the corresponding __.lib__ file in the `/LINK` linker flags. Debugging is facilitated with the corresponding __.pdb__ file.
