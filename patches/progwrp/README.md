## progwrp.dll

This is a wrapper Dynamic Link Library made by the well respected [@win32ss](https://win32subsystem.live/) (also the creator of the [Windows Vista Extended Kernel](https://win32subsystem.live/extended-kernel/)).

"Program Wrapper" enabled programs such as Chromium and Electron to run on Windows versions before 7 RTM (6.1.7600).

It is used when linking the program, and win32 API functions that are not supported on pre-win7 versions are instead redirected to this .dll.
The .dll contains custom implementations of these functions, written in C & C++, "translating" them into something that older Windows can understand.
While this does introduce a little bit of overhead, it simplifies development greatly, and the fact *that we have Chromium M122 working on Windows XP at all* is a godsend for legacy software/hardware enthusiasts.

progwrp is currently used in the [Supermium Web Browser](https://win32subsystem.live/supermium/), to provide an up to date Chromium-based web browser for legacy Windows versions. It is also used here, in [Thorium-Legacy](), for the same purpose.

### Supported Windows Versions

Currently supported Windows versions are:

 - Windows XP x86 (5.1.5512)
 - Windows XP x64 (5.2.5512)

 - Windows Server 2003 x86 (5.2.5512)
 - Windows Server 2003 x64 (5.2.5512)
 - Windows Server 2003 R2 x86 (5.2.5512)
 - Windows Server 2003 R2 x64 (5.2.5512)

 - Windows Vista x86 (6.0.3600)
 - Windows Vista x64 (6.0.3600)

Work in progress support for:

 - Windows 2000 x86 (5.00.2195)
 - Windows 2000 x64 (5.00.2195)

 - Windows 2000 Server x86 (5.00.2195)
 - Windows 2000 Server x64 (5.00.2195)

Note: The latest service pack for these OSes should be applied before trying to run a program compiled with progwrp.dll.

For XP x86, this is SP3. For XP x64 and Server 2003, this is SP2. For Vista, this is SP2. For 2000, this is SP4.

Windows 7 RTM also benefits from progwrp.dll.

Windows 7 SP1 (6.1.7601), Windows 8/Server 2012 (6.2.0), and Windows Server 8.1/Server 2012 R2 (6.3.3900) do not require or benefit at all from progwrp.dll

### Dev Usage

To use this library, one must include the corresponding .lib file in the /LINK linker flags. Debugging is facilitated with the corresponding .pdb file
