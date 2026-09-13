# Catálogo y Análisis Táctico de Repositorios con Estrella (GitHub Stars)

> **Auditoría de Perfil:** `rodrigo47363`  
> **Total de Proyectos Analizados:** `654` repositorios  
> **Enfoque Principal:** Pentesting Ofensivo, Red Teaming, OSINT, Customización Linux & Tooling en Python/Go/C/Rust.

---

## 1. Distribución Global por Dominios de Operación

| Categoría Operativa | Total Repositorios | Porcentaje | Enfoque Táctico |
| :--- | :---: | :---: | :--- |
| **OSINT & Ciberinteligencia de Fuentes Abiertas** | `99` | `15.1%` | Recolección de inteligencia, perfiles sociales, GEOINT, correlación de metadatos y filtraciones. |
| **Seguridad Web, Reconocimiento & Bug Bounty** | `36` | `5.5%` | Fuzzing de endpoints, bypass de WAF, escaneo de vulnerabilidades web (SQLi, XSS, SSRF, IDOR). |
| **Red Team, C2, Malware & Evasión Ofensiva** | `94` | `14.4%` | Command & Control, evasión de EDR/AV, inyección en memoria, AMSI bypass y desarrollo de payloads. |
| **Active Directory & Explotación Windows / PrivEsc** | `22` | `3.4%` | Ataques Kerberos, BloodHound, evasión UAC, elevación local y abuso de identidades de dominio. |
| **Redes, Wi-Fi, Tráfico & Pivoting** | `28` | `4.3%` | Escaneo de puertos, análisis PCAP, ataques a redes 802.11, proxies SOCKS5 y túneles para movimiento lateral. |
| **Credenciales, Wordlists & Password Cracking** | `8` | `1.2%` | Ataques de fuerza bruta offline/online, diccionarios tácticos y extracción de hashes. |
| **Ingeniería Inversa, Pwn & Análisis Binario** | `16` | `2.4%` | Decompilación con Ghidra/radare2, explotación de memoria (ROP, heap/stack) y análisis de firmware/BIOS. |
| **Seguridad Móvil, Android & Reversing Móvil** | `66` | `10.1%` | Instrumentación con Frida/Objection, análisis de APKs, permisos DeviceOwner y ecosistema Android. |
| **Herramientas Generales de Pentesting & Exploits** | `17` | `2.6%` | Frameworks multiuso, repositorios de PoCs y suites de evaluación de seguridad. |
| **Metodologías, Cheat Sheets & Laboratorios CTF** | `22` | `3.4%` | Playbooks de OSCP/eJPT, colecciones de writeups de HackTheBox/TryHackMe y chuletas tácticas. |
| **Linux, Dotfiles, Ricing & Productividad Terminal** | `45` | `6.9%` | Entornos de ventanas (BSPWM, Polybar), configuración de terminales (Kitty, Zsh, Neovim) y scripts de ricing. |
| **Hardware, Drivers & Optimización de Sistema (Acer/Linux)** | `15` | `2.3%` | Control de ventiladores Nitro/Predator, gestión térmica, drivers de GPU y optimización de batería. |
| **Desarrollo de Software, Automatización & Herramientas CLI** | `73` | `11.2%` | Herramientas de línea de comandos en Rust/Go, bots, scrapers y librerías de utilidad. |
| **Miscelánea & Utilidades Generales** | `113` | `17.3%` | Proyectos multipropósito, librerías frontend/backend, utilidades auxiliares y experimentales. |

---

## 2. Lenguajes Tecnológicos Predominantes

| Lenguaje | Repositorios | Porcentaje |
| :--- | :---: | :---: |
| `Python` | `177` | `27.1%` |
| `Otros/Sin lenguaje` | `82` | `12.5%` |
| `Shell` | `55` | `8.4%` |
| `Go` | `46` | `7.0%` |
| `C` | `45` | `6.9%` |
| `C++` | `34` | `5.2%` |
| `TypeScript` | `29` | `4.4%` |
| `JavaScript` | `28` | `4.3%` |
| `HTML` | `25` | `3.8%` |
| `Kotlin` | `24` | `3.7%` |
| `Rust` | `18` | `2.8%` |
| `C#` | `17` | `2.6%` |

---

## 3. Catálogo Detallado por Categoría

### OSINT & Ciberinteligencia de Fuentes Abiertas (99 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [lissy93/web-check](https://github.com/lissy93/web-check) | `TypeScript` | `34,717` | 🕵️‍♂️ All-in-one OSINT tool for analysing any website |
| [jivoi/awesome-osint](https://github.com/jivoi/awesome-osint) | `—` | `29,243` | :scream: A curated list of amazingly awesome OSINT |
| [qeeqbox/social-analyzer](https://github.com/qeeqbox/social-analyzer) | `JavaScript` | `23,985` | API, CLI, and Web App for analyzing and finding a person's profile in 1000 social media \ websites |
| [smicallef/spiderfoot](https://github.com/smicallef/spiderfoot) | `Python` | `21,989` | SpiderFoot automates OSINT for threat intelligence and mapping your attack surface. |
| [mxrch/GHunt](https://github.com/mxrch/GHunt) | `Python` | `19,524` | 🕵️‍♂️ Offensive Google framework. |
| [sundowndev/phoneinfoga](https://github.com/sundowndev/phoneinfoga) | `Go` | `17,820` | Information gathering framework for phone numbers |
| [laramies/theHarvester](https://github.com/laramies/theHarvester) | `Python` | `17,334` | E-mails, subdomains and names Harvester - OSINT  |
| [owasp-amass/amass](https://github.com/owasp-amass/amass) | `Go` | `15,134` | In-depth attack surface mapping and asset discovery |
| [megadose/holehe](https://github.com/megadose/holehe) | `Python` | `14,843` | holehe allows you to check if the mail is used on different sites like twitter, instagram and will retrieve information on site... |
| [projectdiscovery/subfinder](https://github.com/projectdiscovery/subfinder) | `Go` | `14,413` | Fast passive subdomain enumeration tool. |
| [Datalux/Osintgram](https://github.com/Datalux/Osintgram) | `Python` | `14,354` | Osintgram is a OSINT tool on Instagram. It offers an interactive shell to perform analysis on Instagram account of any users by... |
| [instaloader/instaloader](https://github.com/instaloader/instaloader) | `Python` | `13,328` | Download pictures (or videos) along with their captions and other metadata from Instagram. |
| [edoardottt/awesome-hacker-search-engines](https://github.com/edoardottt/awesome-hacker-search-engines) | `Shell` | `11,148` | A curated list of awesome search engines useful during Penetration testing, Vulnerability assessments, Red/Blue Team operations... |
| [BigBodyCobain/Shadowbroker](https://github.com/BigBodyCobain/Shadowbroker) | `Python` | `11,101` | Open-source intelligence for the global theater. Track everything from the corporate/private jets of the wealthy, and spy satel... |
| [projectdiscovery/httpx](https://github.com/projectdiscovery/httpx) | `Go` | `10,380` | httpx is a fast and multi-purpose HTTP toolkit that allows running multiple probes using the retryablehttp library. |
| [thewhiteh4t/seeker](https://github.com/thewhiteh4t/seeker) | `CSS` | `9,985` | Accurately Locate Smartphones using Social Engineering  |
| [cipher387/osint_stuff_tool_collection](https://github.com/cipher387/osint_stuff_tool_collection) | `HTML` | `8,802` | A collection of several hundred online tools for OSINT |
| [six2dez/reconftw](https://github.com/six2dez/reconftw) | `Shell` | `8,079` | reconFTW is a tool designed to perform automated recon on a target domain by running the best set of tools to perform scanning ... |
| [antoniaci/blackbird](https://github.com/antoniaci/blackbird) | `Python` | `8,001` | An OSINT tool to search for accounts by username and email in social networks. |
| [FluxionNetwork/fluxion](https://github.com/FluxionNetwork/fluxion) | `HTML` | `5,924` | Fluxion is a remake of linset by vk496 with enhanced functionality. |
| [hakluke/hakrawler](https://github.com/hakluke/hakrawler) | `Go` | `5,123` | Simple, fast web crawler designed for easy, quick discovery of endpoints and assets within a web application |
| [davidarroyo1234/InstagramUnfollowers](https://github.com/davidarroyo1234/InstagramUnfollowers) | `HTML` | `4,828` | Check if people follows you back on Instagram. |
| [spipm/Depixelization_poc](https://github.com/spipm/Depixelization_poc) | `Python` | `4,550` | Depix is a PoC for a technique to recover plaintext from pixelized screenshots. |
| [megadose/toutatis](https://github.com/megadose/toutatis) | `Python` | `4,268` | Toutatis is a tool that allows you to extract information from instagrams accounts such as e-mails, phone numbers and more |
| [jasonxtn/Argus](https://github.com/jasonxtn/Argus) | `Python` | `4,123` | The Ultimate Information Gathering Toolkit |
| [evyatarmeged/Raccoon](https://github.com/evyatarmeged/Raccoon) | `Python` | `4,020` | A high performance offensive security tool for reconnaissance and vulnerability scanning |
| [sinwindie/OSINT](https://github.com/sinwindie/OSINT) | `Python` | `3,730` | Collections of tools and methods created to aid in OSINT collection |
| [ibnaleem/gosearch](https://github.com/ibnaleem/gosearch) | `Go` | `3,651` | 🔍 Search anyone's digital footprint across 300+ websites |
| [0x0be/yesitsme](https://github.com/0x0be/yesitsme) | `Python` | `3,055` | Simple OSINT script to find Instagram profiles by name and e-mail/phone  |
| [Alfredredbird/tookie-osint](https://github.com/Alfredredbird/tookie-osint) | `Python` | `2,915` | Tookie is a advanced OSINT information gathering tool that finds social media accounts based on inputs. |
| [i-am-shodan/USBArmyKnife](https://github.com/i-am-shodan/USBArmyKnife) | `C++` | `2,897` | USB Army Knife – the ultimate close access tool for penetration testers and red teamers. |
| [martinvigo/email2phonenumber](https://github.com/martinvigo/email2phonenumber) | `Python` | `2,757` | A OSINT tool to obtain a target's phone number just by having his email address |
| [cipher387/Dorks-collections-list](https://github.com/cipher387/Dorks-collections-list) | `—` | `2,744` | List of Github repositories and articles with list of dorks for different search engines |
| [cipher387/API-s-for-OSINT](https://github.com/cipher387/API-s-for-OSINT) | `—` | `2,532` | List of API's for gathering information about phone numbers, addresses, domains etc |
| [Jieyab89/OSINT-Cheat-sheet](https://github.com/Jieyab89/OSINT-Cheat-sheet) | `HTML` | `2,207` | OSINT cheat sheet, list OSINT tools, wiki, dataset, article, book , red team OSINT for hackers and OSINT tips and OSINT branch.... |
| [sushiwushi/bug-bounty-dorks](https://github.com/sushiwushi/bug-bounty-dorks) | `—` | `2,100` | List of Google Dorks for sites that have responsible disclosure program / bug bounty program |
| [AzizKpln/Gokboru_Intel](https://github.com/AzizKpln/Gokboru_Intel) | `Python` | `2,086` | This tool gives information about the phone number that you entered. |
| [megadose/ignorant](https://github.com/megadose/ignorant) | `Python` | `2,047` | ignorant allows you to check if a phone number is used on different sites like snapchat, instagram. |
| [osintambition/Social-Media-OSINT-Tools-Collection](https://github.com/osintambition/Social-Media-OSINT-Tools-Collection) | `—` | `1,969` | A collection of most useful osint tools for SOCINT. |
| [HackUnderway/SearchPhone](https://github.com/HackUnderway/SearchPhone) | `Python` | `1,959` | Phone number OSINT toolkit with multi-API search (Google, GitHub, Numverify, Reddit, DuckDuckGo), Hudson Rock infostealer intel... |
| [TakSec/google-dorks-bug-bounty](https://github.com/TakSec/google-dorks-bug-bounty) | `—` | `1,903` | A list of Google Dorks for Bug Bounty, Web Application Security, and Pentesting |
| [Clats97/ClatScope](https://github.com/Clats97/ClatScope) | `Python` | `1,569` | ClatScope Info Tool – The best and most versatile OSINT utility for retrieving geolocation, DNS, WHOIS, phone, email, data brea... |
| [th3unkn0n/osi.ig](https://github.com/th3unkn0n/osi.ig) | `Python` | `1,560` | Information Gathering Instagram. |
| [jasperan/whatsapp-osint](https://github.com/jasperan/whatsapp-osint) | `Python` | `1,523` | WhatsApp spy - logs online/offline events from ANYONE in the world |
| [twelvesec/gasmask](https://github.com/twelvesec/gasmask) | `Python` | `1,466` | Information gathering tool - OSINT |
| [urbanadventurer/username-anarchy](https://github.com/urbanadventurer/username-anarchy) | `Ruby` | `1,465` | Username tools for penetration testing |
| [misiektoja/instagram_monitor](https://github.com/misiektoja/instagram_monitor) | `Python` | `1,442` | Track Instagram users' activities, profile changes and capture content with beautiful dashboards and instant notifications |
| [BushidoUK/Ransomware-Tool-Matrix](https://github.com/BushidoUK/Ransomware-Tool-Matrix) | `—` | `1,441` | A resource containing all the tools each ransomware gangs uses |
| [dwisiswant0/go-dork](https://github.com/dwisiswant0/go-dork) | `Go` | `1,304` | The fastest dork scanner written in Go. |
| [pielco11/fav-up](https://github.com/pielco11/fav-up) | `Python` | `1,199` | IP lookup by favicon using Shodan |
| [N0rz3/Phunter](https://github.com/N0rz3/Phunter) | `Python` | `1,191` | Phunter is an osint tool allowing you to find various information via a phone number 🔎📞 |
| [projectdiscovery/asnmap](https://github.com/projectdiscovery/asnmap) | `Go` | `1,126` | Go CLI and Library for quickly mapping organization network ranges using ASN information. |
| [tracelabs/tlosint-vm](https://github.com/tracelabs/tlosint-vm) | `Shell` | `1,118` | Trace Labs OSINT VM |
| [devxprite/infoooze](https://github.com/devxprite/infoooze) | `JavaScript` | `1,080` | A OSINT tool which helps you to quickly find information effectively. All you need is to input and it will take take care of rest. |
| [0x6rss/matkap](https://github.com/0x6rss/matkap) | `JavaScript` | `1,026` | Matkap - hunt down malicious Telegram bots |
| [JackJuly/linkook](https://github.com/JackJuly/linkook) | `Python` | `1,014` | 🔍 An OSINT tool for discovering linked social accounts and associated emails across multiple platforms using a single username. |
| [The-Osint-Toolbox/Social-Media-OSINT](https://github.com/The-Osint-Toolbox/Social-Media-OSINT) | `—` | `1,002` | Social Media OSINT collection containing - tools, techniques & tradecraft. |
| [obitouka/InstagramPrivSniffer](https://github.com/obitouka/InstagramPrivSniffer) | `Python` | `997` |  First ever tool to view "Instagram private posts" anonymously  |
| [kennbroorg/iKy](https://github.com/kennbroorg/iKy) | `Python` | `975` | OSINT Project. Collect information from a mail. Gather. Profile. Timeline. |
| [sharsil/mailcat](https://github.com/sharsil/mailcat) | `Python` | `941` | Find existing email addresses by nickname using API/SMTP checking methods without user notification. Please, don't hesitate to ... |
| [mi-g-alex/Telegram-Monet](https://github.com/mi-g-alex/Telegram-Monet) | `Kotlin` | `896` | Create themes for telegram using material 3 colors |
| [wddadk/OSINT-for-countries](https://github.com/wddadk/OSINT-for-countries) | `—` | `892` | Methodology, links, tools for OSINT in different countries |
| [n0mi1k/apk2url](https://github.com/n0mi1k/apk2url) | `Shell` | `874` | An OSINT tool to quickly extract IP and URL endpoints from APKs by disassembling and decompiling |
| [spider863644/PhoneNumber-OSINT](https://github.com/spider863644/PhoneNumber-OSINT) | `Python` | `849` | An OSINT tool for gathering information about phone numbers |
| [jerlendds/osintbuddy](https://github.com/jerlendds/osintbuddy) | `TypeScript` | `840` | Node graphs, OSINT data mining,  and plugins. Connect unstructured and public data for transformative insights. The rewrite can... |
| [SecShiv/OneDorkForAll](https://github.com/SecShiv/OneDorkForAll) | `—` | `824` | An insane list of all dorks taken from everywhere from various different sources. |
| [vil/H4X-Tools](https://github.com/vil/H4X-Tools) | `Python` | `823` | A modular, terminal-based toolkit for OSINT, reconnaissance, and scraping - built in Python, runs on Linux and Windows. |
| [theahmadov/slash](https://github.com/theahmadov/slash) | `Python` | `737` | The Slash OSINT Tool |
| [s41r4j/phomber](https://github.com/s41r4j/phomber) | `Python` | `602` | [PH0MBER]: An open source infomation grathering & reconnaissance framework! |
| [estebanpdl/osintgpt](https://github.com/estebanpdl/osintgpt) | `Python` | `526` | An open-source intelligence (OSINT) analysis tool leveraging GPT-powered embeddings and vector search engines for efficient dat... |
| [pwnfoo/NTLMRecon](https://github.com/pwnfoo/NTLMRecon) | `Python` | `509` | Enumerate information from NTLM authentication enabled web endpoints 🔎 |
| [diezo/Ensta](https://github.com/diezo/Ensta) | `Python` | `489` | 🔥 Python Library for Instagram Web & Mobile API Integration |
| [WatchDogSecurity/porch-pirate](https://github.com/WatchDogSecurity/porch-pirate) | `Python` | `474` | Porch Pirate is the most comprehensive Postman recon / OSINT client and framework that facilitates the automated discovery and ... |
| [CScorza/OSINTAnonymous](https://github.com/CScorza/OSINTAnonymous) | `—` | `473` | Creazione d'identità Fake - Impostazione Privacy Profili Social - Creazione Ambiente di Lavoro  |
| [powerexploit/Ashok](https://github.com/powerexploit/Ashok) | `Python` | `445` | Ashok is a OSINT Recon Tool , a.k.a :heart_eyes:  Swiss Army knife . |
| [yezz123/SoIG](https://github.com/yezz123/SoIG) | `Python` | `421` | OSINT Tool gets a range of information from an Instagram account 🛠 |
| [FofaInfo/Awesome-FOFA](https://github.com/FofaInfo/Awesome-FOFA) | `—` | `351` | The FOFA Library collects usage tips, common scenarios, F&Q, and more for FOFA. |
| [HackUnderway/WhatsOSINT](https://github.com/HackUnderway/WhatsOSINT) | `Python` | `339` | View data of a WhatsApp number, including its status, photo, etc. 🕵🏽‍♂️ |
| [warengonzaga/wifi-passview](https://github.com/warengonzaga/wifi-passview) | `Batchfile` | `337` | An open source batch script based WiFi Passview for Windows! |
| [Cyber-Dioxide/IP_Rover](https://github.com/Cyber-Dioxide/IP_Rover) | `Python` | `301` | An Excellent OSINT tool to get information of any ip address. All details are explained in below screenshot |
| [phoneintel/phoneintel](https://github.com/phoneintel/phoneintel) | `Python` | `295` | PhoneIntel is an OSINT tool for retrieving detailed information about phone numbers.  |
| [senran101604/sagemode](https://github.com/senran101604/sagemode) | `Python` | `281` |  👀Sagemode: Track and Unveil Online identities across social media platforms🕵️‍♂️ |
| [Spix0r/robofinder](https://github.com/Spix0r/robofinder) | `Python` | `268` | Robofinder fetches historical robots.txt files from Archive.org to uncover old directories, hidden paths, and valuable OSINT da... |
| [ubikron/awesome-osint-chrome-extensions](https://github.com/ubikron/awesome-osint-chrome-extensions) | `—` | `253` | Chrome Extensions for OSINT |
| [emrekybs/Pip-Intel](https://github.com/emrekybs/Pip-Intel) | `Shell` | `238` | PIP-INTEL is an OSINT (Open Source Intelligence) tool designed using various open-source tools and pip packages. |
| [resistec/obsidian-osint-templates](https://github.com/resistec/obsidian-osint-templates) | `—` | `185` | Custom templates for OSINT investigations designed to advance pivoting. |
| [ranlo/osintsummit-2023-resources](https://github.com/ranlo/osintsummit-2023-resources) | `—` | `163` | A categorized list of resources presented during the 2023 Sans OSINTSummit |
| [abhinavkavuri/PhoneInfoga](https://github.com/abhinavkavuri/PhoneInfoga) | `Python` | `148` | Advanced information gathering & OSINT tool for phone numbers. |
| [HackUnderway/OsintNum](https://github.com/HackUnderway/OsintNum) | `Python` | `117` | Tool to make OSINT to phone numbers with the help of APILayer, using its api together with Number Verification API. 🕵🏽‍♂️ |
| [amanverasia/Unseen](https://github.com/amanverasia/Unseen) | `Python` | `111` | To perform OSINT on an instagram profile |
| [osintmatter/RequestShield](https://github.com/osintmatter/RequestShield) | `Python` | `108` | RequestShield is a 100% Free and OpenSource tool designed to analyze HTTP access.logs and identify suspicious HTTP requests and... |
| [kienmarkdo/Telegram-OSINT-for-Cyber-Threat-Intelligence-Analysis](https://github.com/kienmarkdo/Telegram-OSINT-for-Cyber-Threat-Intelligence-Analysis) | `Python` | `108` | An OSINT tool tailored for comprehensive collection, analysis, and interpretation of cyber threat intelligence from Telegram ch... |
| [techenthusiast167/OSINTMAILER-](https://github.com/techenthusiast167/OSINTMAILER-) | `—` | `76` | A robust Python-based OSINT tool designed for validating and investigating email addresses across social media platforms and kn... |
| [er4vn/TeleStrike](https://github.com/er4vn/TeleStrike) | `PHP` | `44` | TeleStrike is a red team utility designed for adversary simulation and security auditing of Telegram accounts. Built for educat... |
| [soxoj/CommiPiste](https://github.com/soxoj/CommiPiste) | `Python` | `40` | OSINT tool for precise version fingerprinting of open-source web software |
| [azurejoga/osint-explorer](https://github.com/azurejoga/osint-explorer) | `JavaScript` | `37` | 1300 OSINT tools on PC and mobile devices! take open research to the next generation level! |
| [f09l/uosint](https://github.com/f09l/uosint) | `Python` | `22` | Uosint is a versatile Instagram OSINT tool for gathering valuable insights and information from Instagram profiles, posts, and ... |
| [Bugs-B0unt3r/geoint-colombia](https://github.com/Bugs-B0unt3r/geoint-colombia) | `—` | `21` | This document contains a list of tools and platforms that allow for GEOINT analysis focused on Colombia. |
| [odulDC13/ip-geolocation](https://github.com/odulDC13/ip-geolocation) | `Python` | `3` | With this script we can obtain information from an IP |

### Seguridad Web, Reconocimiento & Bug Bounty (36 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [danielmiessler/SecLists](https://github.com/danielmiessler/SecLists) | `PHP` | `73,409` | SecLists is the security tester's companion. It's a collection of multiple types of lists used during security assessments, col... |
| [sqlmapproject/sqlmap](https://github.com/sqlmapproject/sqlmap) | `Python` | `38,395` | Automatic SQL injection and database takeover tool |
| [OWASP/CheatSheetSeries](https://github.com/OWASP/CheatSheetSeries) | `Python` | `33,133` | The OWASP Cheat Sheet Series was created to provide a concise collection of high value information on specific application secu... |
| [chaitin/SafeLine](https://github.com/chaitin/SafeLine) | `Go` | `22,549` | SafeLine is a self-hosted WAF(Web Application Firewall) / reverse proxy to protect your web apps from attacks and exploits. |
| [ffuf/ffuf](https://github.com/ffuf/ffuf) | `Go` | `16,662` | Fast web fuzzer written in Go |
| [OJ/gobuster](https://github.com/OJ/gobuster) | `Go` | `14,098` | Directory/File, DNS and VHost busting tool written in Go |
| [projectdiscovery/nuclei-templates](https://github.com/projectdiscovery/nuclei-templates) | `JavaScript` | `12,940` | Community curated list of templates for the nuclei engine to find security vulnerabilities. |
| [dstotijn/hetty](https://github.com/dstotijn/hetty) | `Go` | `12,461` | An HTTP toolkit for security research. |
| [nahamsec/Resources-for-Beginner-Bug-Bounty-Hunters](https://github.com/nahamsec/Resources-for-Beginner-Bug-Bounty-Hunters) | `—` | `12,237` | A list of resources for those interested in getting started in bug bounties |
| [aboul3la/Sublist3r](https://github.com/aboul3la/Sublist3r) | `Python` | `11,039` | Fast subdomains enumeration tool for penetration testers |
| [EnableSecurity/wafw00f](https://github.com/EnableSecurity/wafw00f) | `Python` | `6,540` | WAFW00F allows one to identify and fingerprint Web Application Firewall (WAF) products protecting a website. |
| [reddelexc/hackerone-reports](https://github.com/reddelexc/hackerone-reports) | `Python` | `6,533` | Top disclosed reports from HackerOne |
| [hahwul/dalfox](https://github.com/hahwul/dalfox) | `Rust` | `5,287` | 🌙🦊 Dalfox is a powerful open-source XSS scanner and utility focused on automation. |
| [hahwul/WebHackersWeapons](https://github.com/hahwul/WebHackersWeapons) | `Ruby` | `5,058` | ⚔️ Web Hacker's Weapons / A collection of cool tools used by Web hackers. Happy hacking , Happy bug-hunting |
| [Ignitetechnologies/BurpSuite-For-Pentester](https://github.com/Ignitetechnologies/BurpSuite-For-Pentester) | `—` | `2,590` | This cheatsheet is built for the Bug Bounty Hunters and penetration testers in order to help them hunt the vulnerabilities from... |
| [wagiro/BurpBounty](https://github.com/wagiro/BurpBounty) | `Java` | `1,814` | Burp Bounty (Scan Check Builder in BApp Store) is a extension of Burp Suite that allows you, in a quick and simple way, to impr... |
| [The-XSS-Rat/SecurityTesting](https://github.com/The-XSS-Rat/SecurityTesting) | `Python` | `1,644` | Sin descripción |
| [coffinxp/loxs](https://github.com/coffinxp/loxs) | `Python` | `1,617` | best tool for finding SQLi,CRLF,XSS,LFi,OpenRedirect |
| [RenwaX23/XSS-Payloads](https://github.com/RenwaX23/XSS-Payloads) | `—` | `1,391` | List of XSS Vectors/Payloads  |
| [0xacb/recollapse](https://github.com/0xacb/recollapse) | `Python` | `1,372` | REcollapse is a helper tool for black-box regex fuzzing to bypass validations and discover normalizations in web applications |
| [PortSwigger/mcp-server](https://github.com/PortSwigger/mcp-server) | `Kotlin` | `1,150` | MCP Server for Burp |
| [xm1k3/cent](https://github.com/xm1k3/cent) | `Go` | `1,048` | Community edition nuclei templates, a simple tool that allows you to organize all the Nuclei templates offered by the community... |
| [strozfriedberg/PadBuster](https://github.com/strozfriedberg/PadBuster) | `Perl` | `813` | Automated script for performing Padding Oracle attacks |
| [Mehdi0x90/Web_Hacking](https://github.com/Mehdi0x90/Web_Hacking) | `—` | `806` | Bug Bounty Tricks and useful payloads and bypasses for Web Application Security. |
| [coffinxp/nuclei-templates](https://github.com/coffinxp/nuclei-templates) | `—` | `544` | Sin descripción |
| [cc1a2b/JShunter](https://github.com/cc1a2b/JShunter) | `Go` | `534` | jshunter is a command-line tool designed for analyzing JavaScript files and extracting endpoints. This tool specializes in iden... |
| [nahamsec/nahamsec.training](https://github.com/nahamsec/nahamsec.training) | `PHP` | `487` | The labs for my Udemy course (https://www.udemy.com/course/intro-to-bug-bounty-by-nahamsec) |
| [CervantesSec/cervantes](https://github.com/CervantesSec/cervantes) | `C#` | `449` | Cervantes is an open-source, collaborative platform designed specifically for pentesters and red teams. It serves as a comprehe... |
| [projectdiscovery/awesome-search-queries](https://github.com/projectdiscovery/awesome-search-queries) | `Go` | `409` | Community curated list of search queries for various products across multiple search engines. |
| [nullthrix/BugBounty-Methodology](https://github.com/nullthrix/BugBounty-Methodology) | `Python` | `96` | Sin descripción |
| [n0kovo/awesome-wordlists](https://github.com/n0kovo/awesome-wordlists) | `—` | `86` | A curated list wordlists for bruteforcing and fuzzing |
| [Cybersecurity-Ethical-Hacker/xssdynagen](https://github.com/Cybersecurity-Ethical-Hacker/xssdynagen) | `Python` | `56` | 🪄 XSSDynaGen is a tool designed to analyze URLs with parameters, identify the characters allowed by the server, and generate ad... |
| [skm248/BurpSuiteInstaller](https://github.com/skm248/BurpSuiteInstaller) | `—` | `23` | Install and Activate your Burp Suite Professional with ase. |
| [Y000o/Inyeccion-sql-automatizada-con-sqlmap](https://github.com/Y000o/Inyeccion-sql-automatizada-con-sqlmap) | `—` | `23` | Sin descripción |
| [Senanfurkan/Chaos-Recon](https://github.com/Senanfurkan/Chaos-Recon) | `Shell` | `18` | This little script for gathering chaos.projectdiscovery.io recon data in an organized way and finding the daily differences on it |
| [morpheuslord/BurpSuiteInstaller](https://github.com/morpheuslord/BurpSuiteInstaller) | `—` | `1` | Install and Crack your Burp Suite Professional Latest (Updated Weekly). |

### Red Team, C2, Malware & Evasión Ofensiva (94 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [codecrafters-io/build-your-own-x](https://github.com/codecrafters-io/build-your-own-x) | `Markdown` | `546,267` | Master programming by recreating your favorite technologies from scratch. |
| [jwasham/coding-interview-university](https://github.com/jwasham/coding-interview-university) | `—` | `360,657` | A complete computer science study plan to become a software engineer. |
| [practical-tutorials/project-based-learning](https://github.com/practical-tutorials/project-based-learning) | `Python` | `282,795` | Curated list of project-based tutorials |
| [n8n-io/n8n](https://github.com/n8n-io/n8n) | `TypeScript` | `203,887` | Fair-code workflow automation platform with native AI capabilities. Combine visual building with custom code, self-host or clou... |
| [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) | `Shell` | `189,647` | 🙃   A delightful community-driven (with 2,500+ contributors) framework for managing your zsh configuration. Includes 300+ optio... |
| [AUTOMATIC1111/stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui) | `Python` | `164,881` | Stable Diffusion web UI |
| [bradtraversy/design-resources-for-developers](https://github.com/bradtraversy/design-resources-for-developers) | `—` | `66,882` | Curated list of design and UI resources from stock photos, web templates, CSS frameworks, UI libraries, tools and much more |
| [Mintplex-Labs/anything-llm](https://github.com/Mintplex-Labs/anything-llm) | `JavaScript` | `65,855` | Stop renting your intelligence. Own it with AnythingLLM. Everything you need for a powerful local-first agent experience  |
| [SerenityOS/serenity](https://github.com/SerenityOS/serenity) | `C++` | `33,801` | The Serenity Operating System 🐞 |
| [abhisheknaiidu/awesome-github-profile-readme](https://github.com/abhisheknaiidu/awesome-github-profile-readme) | `—` | `31,029` | 😎 A curated list of awesome GitHub Profile which updates in real time  |
| [The-Art-of-Hacking/h4cker](https://github.com/The-Art-of-Hacking/h4cker) | `Jupyter Notebook` | `29,348` | This repository is maintained by Omar Santos (@santosomar) and includes thousands of resources related to ethical hacking, bug ... |
| [NvChad/NvChad](https://github.com/NvChad/NvChad) | `Lua` | `28,473` | Blazing fast Neovim framework providing solid defaults and a beautiful UI, enhancing your neovim experience. |
| [enaqx/awesome-pentest](https://github.com/enaqx/awesome-pentest) | `—` | `27,158` | A collection of awesome penetration testing resources, tools and other shiny things |
| [winboat-org/winboat](https://github.com/winboat-org/winboat) | `TypeScript` | `22,733` | Run Windows apps on 🐧 Linux with ✨ seamless integration |
| [11ty/buildawesome](https://github.com/11ty/buildawesome) | `JavaScript` | `19,893` | A simpler site generator. Transforms a directory of templates (of varying types) into HTML. |
| [louis-e/arnis](https://github.com/louis-e/arnis) | `Rust` | `17,795` | Generate any location from the real world in Minecraft with a high level of detail. |
| [projectdiscovery/katana](https://github.com/projectdiscovery/katana) | `Go` | `17,438` | A next-generation crawling and spidering framework. |
| [Ileriayo/markdown-badges](https://github.com/Ileriayo/markdown-badges) | `SCSS` | `17,031` | The largest curated collection of markdown badges for your personal developer branding, profile, and projects. |
| [winapps-org/winapps](https://github.com/winapps-org/winapps) | `Shell` | `15,920` |  Run Windows apps such as Microsoft Office/Adobe in Linux (Ubuntu/Fedora) and GNOME/KDE as if they were a part of the native OS... |
| [digininja/DVWA](https://github.com/digininja/DVWA) | `PHP` | `13,635` | Damn Vulnerable Web Application (DVWA) |
| [openwall/john](https://github.com/openwall/john) | `C` | `13,612` | John the Ripper jumbo - advanced offline password cracker, which supports hundreds of hash and cipher types, and runs on many o... |
| [k4m4/terminals-are-sexy](https://github.com/k4m4/terminals-are-sexy) | `Shell` | `13,113` | 💥 A curated list of Terminal frameworks, plugins & resources for CLI lovers. |
| [Manisso/fsociety](https://github.com/Manisso/fsociety) | `Python` | `12,300` | fsociety Hacking Tools Pack – A Penetration Testing Framework |
| [vanhauser-thc/thc-hydra](https://github.com/vanhauser-thc/thc-hydra) | `C` | `12,258` | hydra |
| [netbootxyz/netboot.xyz](https://github.com/netbootxyz/netboot.xyz) | `Jinja` | `12,232` | Your favorite operating systems in one place.  A network-based bootable operating system installer based on iPXE. |
| [Acly/krita-ai-diffusion](https://github.com/Acly/krita-ai-diffusion) | `Python` | `10,565` | Streamlined interface for generating images with AI in Krita. Inpaint and outpaint with optional text prompt, no tweaking requi... |
| [juliocesarfort/public-pentesting-reports](https://github.com/juliocesarfort/public-pentesting-reports) | `HTML` | `9,723` | A list of public penetration test reports published by several consulting firms and academic security groups. |
| [berzerk0/Probable-Wordlists](https://github.com/berzerk0/Probable-Wordlists) | `—` | `9,337` | Version 2 is live! Wordlists sorted by probability originally created for password generation and testing - make sure your pass... |
| [WebGoat/WebGoat](https://github.com/WebGoat/WebGoat) | `JavaScript` | `9,328` | WebGoat is a deliberately insecure application |
| [dylanaraps/pywal](https://github.com/dylanaraps/pywal) | `Python` | `9,074` | 🎨 Generate and change color-schemes on the fly. |
| [ublue-os/bazzite](https://github.com/ublue-os/bazzite) | `Just` | `9,057` | Bazzite makes gaming and everyday use smoother and simpler across desktop PCs, handhelds, tablets, and home theater PCs. |
| [flightlessmango/MangoHud](https://github.com/flightlessmango/MangoHud) | `C` | `9,012` | A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more. |
| [epi052/feroxbuster](https://github.com/epi052/feroxbuster) | `Rust` | `8,060` | A fast, simple, recursive content discovery tool written in Rust. |
| [EmenstaNougat/ESP32-BlueJammer](https://github.com/EmenstaNougat/ESP32-BlueJammer) | `—` | `7,981` | The ESP32-BlueJammer (Bluetooth jammer, BLE jammer, WiFi jammer, RC jammer) disrupts 2.4GHz communications. Using an ESP32 and ... |
| [ohmybash/oh-my-bash](https://github.com/ohmybash/oh-my-bash) | `Shell` | `7,691` | A delightful community-driven framework for managing your bash configuration, and an auto-update tool so that makes it easy to ... |
| [SAWARATSUKI/KawaiiLogos](https://github.com/SAWARATSUKI/KawaiiLogos) | `—` | `6,802` | Sin descripción |
| [projectdiscovery/naabu](https://github.com/projectdiscovery/naabu) | `Go` | `6,237` | A fast port scanner written in go with a focus on reliability and simplicity. Designed to be used in combination with other too... |
| [daattali/beautiful-jekyll](https://github.com/daattali/beautiful-jekyll) | `HTML` | `5,825` | ✨ Build a beautiful and simple website in literally minutes. Demo at https://beautifuljekyll.com |
| [ilya-zlobintsev/LACT](https://github.com/ilya-zlobintsev/LACT) | `Rust` | `5,564` | Linux GPU Configuration And Monitoring Tool |
| [tmoroney/auto-subs](https://github.com/tmoroney/auto-subs) | `TypeScript` | `4,166` | On-device subtitle generation that connects directly to DaVinci Resolve, Premiere, and After Effects. |
| [r0oth3x49/ghauri](https://github.com/r0oth3x49/ghauri) | `Python` | `4,079` | An advanced cross-platform tool that automates the process of detecting and exploiting SQL injection security flaws |
| [FastForwardTeam/FastForward](https://github.com/FastForwardTeam/FastForward) | `JavaScript` | `3,771` | Don't waste your time with compliance. FastForward automatically skips annoying link shorteners. |
| [matro7sh/BypassAV](https://github.com/matro7sh/BypassAV) | `—` | `3,437` | This map lists the essential techniques to bypass anti-virus and EDR |
| [sleuthkit/autopsy](https://github.com/sleuthkit/autopsy) | `Java` | `3,314` | Autopsy® is a digital forensics platform and graphical interface to The Sleuth Kit® and other digital forensics tools. It can b... |
| [Ignitetch/AdvPhishing](https://github.com/Ignitetch/AdvPhishing) | `Hack` | `3,280` | This is Advance Phishing Tool ! OTP PHISHING |
| [ZerBea/hcxtools](https://github.com/ZerBea/hcxtools) | `C` | `2,437` | A small set of tools to convert packets from capture files to hash files for use with Hashcat or John the Ripper.  |
| [google-antigravity/antigravity-cli](https://github.com/google-antigravity/antigravity-cli) | `—` | `2,225` | Antigravity CLI brings the reasoning, execution, and orchestration capabilities of Antigravity agent harness directly into your... |
| [ZerBea/hcxdumptool](https://github.com/ZerBea/hcxdumptool) | `C` | `2,193` | Small tool to capture packets from wlan devices. |
| [microsoft/AI-Red-Teaming-Playground-Labs](https://github.com/microsoft/AI-Red-Teaming-Playground-Labs) | `TypeScript` | `2,061` | AI Red Teaming playground labs to run AI Red Teaming trainings including infrastructure. |
| [numworks/epsilon](https://github.com/numworks/epsilon) | `C++` | `1,950` | Modern graphing calculator operating system. |
| [LadyKerr/github-certification-guide](https://github.com/LadyKerr/github-certification-guide) | `—` | `1,911` | Resources to help you get GitHub certified ✨ |
| [vladko312/SSTImap](https://github.com/vladko312/SSTImap) | `Python` | `1,637` | Automatic SSTI detection tool with interactive interface |
| [syndrizzle/hotfiles](https://github.com/syndrizzle/hotfiles) | `—` | `1,572` | 🏠 A collection of personal configuration files for various rices I have made. |
| [rmyndharis/antigravity-skills](https://github.com/rmyndharis/antigravity-skills) | `JavaScript` | `1,519` | A curated collection of Agent Skills for Google Antigravity |
| [bacher09/pwgen-for-bios](https://github.com/bacher09/pwgen-for-bios) | `TypeScript` | `1,441` | Password generator for BIOS |
| [netsniff-ng/netsniff-ng](https://github.com/netsniff-ng/netsniff-ng) | `C` | `1,422` | A Swiss army knife for your daily Linux network plumbing. |
| [ai-to-ai/Auto-Gmail-Creator](https://github.com/ai-to-ai/Auto-Gmail-Creator) | `Python` | `1,376` | Open Source Bulk Auto Gmail Creator Bot with Selenium & Seleniumwire ( Python ). Feel free to contact me with Django/Flask, ML,... |
| [github/gh-skyline](https://github.com/github/gh-skyline) | `Go` | `1,338` | A GitHub CLI extension to generate a 3D model of your GitHub contribution history |
| [stats-organization/github-stats-extended](https://github.com/stats-organization/github-stats-extended) | `TypeScript` | `1,193` | Dynamically generate GitHub stats for your READMEs. |
| [JPaulMora/Pyrit](https://github.com/JPaulMora/Pyrit) | `Python` | `1,135` | The famous WPA precomputed cracker, Migrated from Google. |
| [rodolfomarianocy/OSCP-Tricks](https://github.com/rodolfomarianocy/OSCP-Tricks) | `—` | `1,102` | OSCP Preparation Guide \| Courses, Tricks, Tutorials, Exercises, Machines |
| [NexovaDev/UpdateHub](https://github.com/NexovaDev/UpdateHub) | `—` | `838` | UpdateHub is an app that simplifies updating software on your computer. A user-friendly interface allows you to quickly check f... |
| [bahaabdelwahed/killshot](https://github.com/bahaabdelwahed/killshot) | `Ruby` | `782` | A Penetration Testing Framework, Information gathering tool & Website Vulnerability Scanner |
| [ultrasecurity/webkiller](https://github.com/ultrasecurity/webkiller) | `Python` | `750` | Tool Information Gathering Write By Python. |
| [AgriciDaniel/codex-seo](https://github.com/AgriciDaniel/codex-seo) | `Python` | `694` | Codex-first SEO skill suite. 26 workflows, 24 TOML agents, DataForSEO/Gemini/Google/Firecrawl integrations, GEO/AEO, CWV, schem... |
| [coffinxp/payloads](https://github.com/coffinxp/payloads) | `—` | `652` | Sin descripción |
| [trap-bytes/403jump](https://github.com/trap-bytes/403jump) | `Go` | `632` | HTTP 403 bypass tool |
| [engn33r/awesome-bluetooth-security](https://github.com/engn33r/awesome-bluetooth-security) | `—` | `614` | List of Bluetooth BR/EDR/LE security resources |
| [pebble-dev/RebbleOS](https://github.com/pebble-dev/RebbleOS) | `C` | `589` | open source operating system for low-power smartwatches |
| [ChrisTitusTech/bypassnro](https://github.com/ChrisTitusTech/bypassnro) | `Batchfile` | `569` | Fixing Microsoft's removal of BypassNRO |
| [mikeroyal/AWS-Guide](https://github.com/mikeroyal/AWS-Guide) | `Java` | `557` | Amazon Web Services (AWS) Guide. Learn all about Amazon Web Services Tools, Services, and Certifications. |
| [13atm01/GRUB-Theme](https://github.com/13atm01/GRUB-Theme) | `Shell` | `516` | GRUB Themes with the theme from the anime The Quintessential Quintuplets, Fate Series, Lycoris Recoil, VTuber, Game Doki Doki L... |
| [proj-airi/awesome-ai-vtubers](https://github.com/proj-airi/awesome-ai-vtubers) | `—` | `491` | 🧾🧸 A curated list of AI VTubers and their related projects |
| [Maldela/fancontrol-gui](https://github.com/Maldela/fancontrol-gui) | `C++` | `390` | GUI for Fancontrol. It uses the KAuth module of the KDE Frameworks 5 to write the generated config file. Furthermore it communi... |
| [leamsigc/ShortsGenerator](https://github.com/leamsigc/ShortsGenerator) | `Python` | `348` | Automate the creation of Shorts content locally with a couple simple steps. |
| [PhoenixC2/PhoenixC2](https://github.com/PhoenixC2/PhoenixC2) | `Python` | `325` | Command & Control-Framework created for collaboration in python3 |
| [borfast/arrispwgen](https://github.com/borfast/arrispwgen) | `TypeScript` | `171` | A "password of the day" generator for Arris cable modems. |
| [tayontech/kali-soc-terraform](https://github.com/tayontech/kali-soc-terraform) | `HCL` | `122` | This project is a Terraform-based implementation for deploying a Security Operations Center (SOC) using Kali Linux in AWS. It p... |
| [ZerBea/hcxkeys](https://github.com/ZerBea/hcxkeys) | `C` | `119` | Small set of tools to generate plainmasterkeys (rainbowtables) and hashes for the use with latest hashcat and John the Ripper. |
| [fulvius31/OneShot](https://github.com/fulvius31/OneShot) | `Python` | `103` | Run WPS PIN attacks (Pixie Dust, online bruteforce, PIN prediction) without monitor mode with the wpa_supplicant |
| [murat-exp/Domain-Checker-Tool](https://github.com/murat-exp/Domain-Checker-Tool) | `Go` | `92` | A high-performance Go-based tool for checking the availability and responsiveness of domains, utilizing both HTTP requests and ... |
| [freelancermijan/payloads](https://github.com/freelancermijan/payloads) | `—` | `64` | Sin descripción |
| [FDX100/cloud-killer](https://github.com/FDX100/cloud-killer) | `Python` | `47` | best application to bypass cloudflare made with  Python3 |
| [0xSojalSec/word-list](https://github.com/0xSojalSec/word-list) | `HTML` | `29` | word-list, payloads , Resources  |
| [ic4rta/Guia-MalDev](https://github.com/ic4rta/Guia-MalDev) | `—` | `29` | Pequeña guia que hice sobre el desarrollo de malware y tecnicas que son usadas |
| [Yextep/Auto-Reverse-Shell-Generator](https://github.com/Yextep/Auto-Reverse-Shell-Generator) | `Shell` | `26` | Generador Automatico de Shell Inversa |
| [dream-wa1ker/pomoc](https://github.com/dream-wa1ker/pomoc) | `C` | `23` | A simple pomodoro for unix based systems. Integrate easily with any bar system. |
| [Mahhheshh/Youtube-Channel-Analyser](https://github.com/Mahhheshh/Youtube-Channel-Analyser) | `Python` | `17` | Streamlit App to Analysyze your favourite creators YouTube channel, Just with an google API key. |
| [steventete/WeatherNow](https://github.com/steventete/WeatherNow) | `JavaScript` | `11` | 🌤️Welcome to the WeatherNow repository, a project created with HTML, CSS, and the power of Vanilla JavaScript for seamless API ... |
| [Bocchi1204/apa7-bilingual](https://github.com/Bocchi1204/apa7-bilingual) | `TypeScript` | `4` | Mobile app to generate APA 7 references (React Native + Expo) |
| [vorosdev/Bspwm](https://github.com/vorosdev/Bspwm) | `Shell` | `4` | My configuration for bspwm |
| [RegreDanger/nexus](https://github.com/RegreDanger/nexus) | `Java` | `3` | Nexus is a lightweight, flexible library for building modular, event-driven apps using CQRS. Use built-in command, query, and e... |
| [z3rObyte/OSidentifier](https://github.com/z3rObyte/OSidentifier) | `Shell` | `3` | A simple script to identify a host's operating system by its IP address |
| [ToroData/asus-rog-keyboard-backlight-control](https://github.com/ToroData/asus-rog-keyboard-backlight-control) | `Shell` | `1` | Scripts and configurations to control the keyboard backlight on ASUS ROG Strix with Arch Linux |

### Active Directory & Explotación Windows / PrivEsc (22 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [massgravel/Microsoft-Activation-Scripts](https://github.com/massgravel/Microsoft-Activation-Scripts) | `Batchfile` | `189,955` | Open-source Windows and Office activator featuring HWID, Ohook, TSforge, and Online KMS activation methods, along with advanced... |
| [swisskyrepo/PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) | `Python` | `80,761` | A list of useful payloads and bypass for Web Application Security and Pentest/CTF |
| [jellyfin/jellyfin](https://github.com/jellyfin/jellyfin) | `C#` | `56,858` | The Free Software Media System - Server Backend & API |
| [projectdiscovery/nuclei](https://github.com/projectdiscovery/nuclei) | `Go` | `31,094` | Nuclei is a fast, customizable vulnerability scanner powered by the global security community and built on a simple YAML-based ... |
| [microsoft/winget-cli](https://github.com/microsoft/winget-cli) | `C++` | `26,406` | WinGet is the Windows Package Manager. This project includes a CLI (Command Line Interface), PowerShell modules, and a COM (Com... |
| [JanDeDobbeleer/oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) | `Go` | `23,434` | The most customisable and low-latency cross platform/shell prompt renderer |
| [Sycnex/Windows10Debloater](https://github.com/Sycnex/Windows10Debloater) | `PowerShell` | `18,832` | Script to remove Windows 10 bloatware. |
| [fortra/impacket](https://github.com/fortra/impacket) | `Python` | `16,081` | Impacket is a collection of Python classes for working with network protocols. |
| [memstechtips/Winhance](https://github.com/memstechtips/Winhance) | `C#` | `12,925` | Application designed to optimize, customize and enhance your Windows experience. |
| [SpecterOps/BloodHound-Legacy](https://github.com/SpecterOps/BloodHound-Legacy) | `PowerShell` | `10,616` | Six Degrees of Domain Admin |
| [IridiumIO/CompactGUI](https://github.com/IridiumIO/CompactGUI) | `Visual Basic .NET` | `8,797` | Reduce the space taken up by games and programs on disk by using native Windows APIs |
| [HotCakeX/Harden-Windows-Security](https://github.com/HotCakeX/Harden-Windows-Security) | `C#` | `4,714` | Harden Windows Safely, Securely using Official Supported Microsoft methods and proper explanation \| Always up-to-date and work... |
| [SpecterOps/BloodHound](https://github.com/SpecterOps/BloodHound) | `Go` | `3,396` | Six Degrees of Domain Admin |
| [devblackops/Terminal-Icons](https://github.com/devblackops/Terminal-Icons) | `PowerShell` | `2,936` | A PowerShell module to show file and folder icons in the terminal |
| [jorhelp/Ingram](https://github.com/jorhelp/Ingram) | `Python` | `2,369` | 网络摄像头漏洞扫描工具 \| Webcam vulnerability scanning tool |
| [Aorimn/dislocker](https://github.com/Aorimn/dislocker) | `C` | `1,932` | FUSE driver to read/write Windows' BitLocker-ed volumes under Linux / Mac OSX |
| [TarlogicSecurity/kerbrute](https://github.com/TarlogicSecurity/kerbrute) | `Python` | `457` | An script to perform kerberos bruteforcing by using impacket |
| [00theway/Ghostcat-CNVD-2020-10487](https://github.com/00theway/Ghostcat-CNVD-2020-10487) | `Python` | `423` | Ghostcat read file/code execute,CNVD-2020-10487(CVE-2020-1938)  |
| [logangoins/Cable](https://github.com/logangoins/Cable) | `C#` | `402` | .NET post-exploitation toolkit for Active Directory reconnaissance and exploitation |
| [caster0x00/Sara](https://github.com/caster0x00/Sara) | `Python` | `342` | MikroTik RouterOS Security Inspector |
| [watchtowrlabs/Fortijump-Exploit-CVE-2024-47575](https://github.com/watchtowrlabs/Fortijump-Exploit-CVE-2024-47575) | `Python` | `97` | Fortinet Fortimanager Unauthenticated Remote Code Execution AKA FortiJump CVE-2024-47575 |
| [nahamsec/wp-cve-intel](https://github.com/nahamsec/wp-cve-intel) | `—` | `48` | Sin descripción |

### Redes, Wi-Fi, Tráfico & Pivoting (28 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [trailofbits/algo](https://github.com/trailofbits/algo) | `Python` | `30,369` | Set up a personal VPN in the cloud |
| [robertdavidgraham/masscan](https://github.com/robertdavidgraham/masscan) | `C` | `25,994` | TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes. |
| [bee-san/RustScan](https://github.com/bee-san/RustScan) | `Rust` | `20,388` | 🤖 The Modern Port Scanner 🤖 |
| [bettercap/bettercap](https://github.com/bettercap/bettercap) | `Go` | `19,952` | The Swiss Army knife for 802.11, BLE, HID, CAN-bus, IPv4 and IPv6 networks reconnaissance and MITM attacks. |
| [jpillora/chisel](https://github.com/jpillora/chisel) | `Go` | `16,510` | A fast TCP/UDP tunnel over HTTP |
| [AgriciDaniel/claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian) | `Python` | `14,779` | Self-organizing AI second brain for Obsidian + Claude Code. Drop any source and Claude reads, links, and files it into one conn... |
| [justcallmekoko/ESP32Marauder](https://github.com/justcallmekoko/ESP32Marauder) | `C++` | `12,289` | A suite of WiFi/Bluetooth offensive and defensive tools for the ESP32 |
| [derv82/wifite2](https://github.com/derv82/wifite2) | `Python` | `8,112` | Rewrite of the popular wireless network auditor, "wifite" |
| [v1s1t0r1sh3r3/airgeddon](https://github.com/v1s1t0r1sh3r3/airgeddon) | `Shell` | `7,980` | This is a multi-use bash script for Linux systems to audit wireless networks. |
| [Pennyw0rth/NetExec](https://github.com/Pennyw0rth/NetExec) | `Python` | `5,851` | The Network Execution Tool |
| [sammwyy/MikuMikuBeam](https://github.com/sammwyy/MikuMikuBeam) | `Go` | `5,846` | An open-source network stresser tool but it's Hatsune Miku |
| [albfan/miraclecast](https://github.com/albfan/miraclecast) | `C` | `4,338` | Connect external monitors to your system via Wifi-Display specification also known as Miracast |
| [openspeedtest/Speed-Test](https://github.com/openspeedtest/Speed-Test) | `JavaScript` | `3,774` | SpeedTest by OpenSpeedTest™ is a Free and Open-Source HTML5 Network Performance Estimation Tool Written in Vanilla Javascript a... |
| [aleixrodriala/wa-tunnel](https://github.com/aleixrodriala/wa-tunnel) | `JavaScript` | `3,347` | Tunneling Internet traffic over Whatsapp |
| [D3Ext/WEF](https://github.com/D3Ext/WEF) | `Shell` | `3,214` | Wi-Fi Exploitation Framework |
| [s0lst1c3/eaphammer](https://github.com/s0lst1c3/eaphammer) | `C` | `2,560` | Targeted evil twin attacks against WPA2-Enterprise networks. Indirect wireless pivots using hostile portal attacks. |
| [kimocoder/wifite2](https://github.com/kimocoder/wifite2) | `Python` | `1,678` | Rewrite of the popular wireless network auditor, "wifite" - original by @derv82 |
| [ronibandini/reggaetonBeGone](https://github.com/ronibandini/reggaetonBeGone) | `Python` | `1,009` | Detects reggaeton genre with Machine Learning and sends packets to disable BT speakers (hopefully) |
| [Cerbrutus-BruteForcer/cerbrutus](https://github.com/Cerbrutus-BruteForcer/cerbrutus) | `Python` | `428` | Network brute force tool, written in Python. Faster than other existing solutions (including the main leader in the network bru... |
| [R3LI4NT/Wifi-Hack](https://github.com/R3LI4NT/Wifi-Hack) | `Python` | `335` | Herramienta automatizada para crackear redes WiFi con protección WPA2 y WPS. |
| [DrPython3/MailRipV2](https://github.com/DrPython3/MailRipV2) | `Python` | `212` | Improved SMTP Checker / SMTP Cracker with proxy-support, inbox test and many more features. |
| [B3ND1X/air-script](https://github.com/B3ND1X/air-script) | `Shell` | `182` | Air Script is a powerful Wi-Fi auditing tool with optional email alerts for captured handshakes. |
| [evozi/hysteria-install](https://github.com/evozi/hysteria-install) | `Shell` | `179` | Hysteria 1 & 2 / SlowUDP one-click installation script |
| [morpheuslord/WinFiHack](https://github.com/morpheuslord/WinFiHack) | `Python` | `82` | A windows Wifi Brute forcing utility which is an extremely old method but still works without the requirement of external depen... |
| [callmezatiel/zarch](https://github.com/callmezatiel/zarch) | `Shell` | `79` | The Ultimate Script For Arch Linux |
| [4lexxe/drive-video-proxy](https://github.com/4lexxe/drive-video-proxy) | `JavaScript` | `64` | Proxy seguro para reproducir videos alojados en Google Drive sin exponer la URL original. Ideal para plataformas educativas o s... |
| [Rhizomatica/rtl8821cu](https://github.com/Rhizomatica/rtl8821cu) | `C` | `11` | Linux Driver for USB WiFi Adapters that are based on the RTL8811CU, RTL8821CU and RTL8731AU Chipsets - v5.12.0 |
| [verasolo1/Nmap-Cheatsheet](https://github.com/verasolo1/Nmap-Cheatsheet) | `—` | `9` | A comprehensive Nmap Cheatsheet |

### Credenciales, Wordlists & Password Cracking (8 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [hashcat/hashcat](https://github.com/hashcat/hashcat) | `C` | `26,740` | World's fastest and most advanced password recovery utility |
| [AlessandroZ/LaZagne](https://github.com/AlessandroZ/LaZagne) | `Python` | `10,974` | Credentials recovery project |
| [projectdiscovery/dnsx](https://github.com/projectdiscovery/dnsx) | `Go` | `2,865` | dnsx is a fast and multi-purpose DNS toolkit allow to run multiple DNS queries of your choice with a list of user-supplied reso... |
| [mufeedvh/pdfrip](https://github.com/mufeedvh/pdfrip) | `Rust` | `1,408` | A multi-threaded PDF password cracking utility equipped with commonly encountered password format builders and dictionary attacks. |
| [HaveIBeenPwned/PwnedPasswordsDownloader](https://github.com/HaveIBeenPwned/PwnedPasswordsDownloader) | `C#` | `1,302` | A tool to download all Pwned Passwords hash ranges and save them offline so they can be used without a dependency on the k-anon... |
| [h4x0r-dz/Leaked-Credentials](https://github.com/h4x0r-dz/Leaked-Credentials) | `—` | `1,053` | how to look for Leaked Credentials ! |
| [kimocoder/OneShot](https://github.com/kimocoder/OneShot) | `Python` | `277` | Run WPS PIN attacks (Pixie Dust, online bruteforce, PIN prediction) without monitor mode with the wpa_supplicant |
| [OffXec/brutecms](https://github.com/OffXec/brutecms) | `Shell` | `45` | Multi-threaded CMS BruteForcer to WordPress, Joomla, Drupal, OpenCart |

### Ingeniería Inversa, Pwn & Análisis Binario (16 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [ventoy/Ventoy](https://github.com/ventoy/Ventoy) | `C` | `79,225` | A new bootable USB solution. |
| [NationalSecurityAgency/ghidra](https://github.com/NationalSecurityAgency/ghidra) | `Java` | `74,709` | Ghidra is a software reverse engineering (SRE) framework |
| [DeusData/codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) | `C` | `42,792` | High-performance code intelligence MCP server. Indexes codebases into a persistent knowledge graph — average repo in millisecon... |
| [pbatard/rufus](https://github.com/pbatard/rufus) | `C` | `37,601` | The Reliable USB Formatting Utility |
| [VSCodium/vscodium](https://github.com/VSCodium/vscodium) | `Shell` | `33,177` | binary releases of VS Code without MS branding/telemetry/licensing |
| [DarkFlippers/unleashed-firmware](https://github.com/DarkFlippers/unleashed-firmware) | `C` | `22,199` | Flipper Zero Unleashed Firmware |
| [baskerville/bspwm](https://github.com/baskerville/bspwm) | `C` | `8,311` | A tiling window manager based on binary space partitioning |
| [LongSoft/UEFITool](https://github.com/LongSoft/UEFITool) | `C` | `5,663` | UEFI firmware image viewer and editor |
| [momo5502/sogen](https://github.com/momo5502/sogen) | `C++` | `3,605` | 🪅 Windows & Linux userspace emulator  |
| [Artikash/Textractor](https://github.com/Artikash/Textractor) | `C++` | `2,691` | Extracts text from video games and visual novels. Highly extensible. |
| [platomav/BIOSUtilities](https://github.com/platomav/BIOSUtilities) | `Python` | `1,086` | Collection of various BIOS/UEFI-related utilities which aid in research and/or modding purposes. |
| [PeterPawn/YourFritz](https://github.com/PeterPawn/YourFritz) | `Shell` | `278` | dynamic package management for AVM routers |
| [ISpillMyDrink/UEFI-Repair-Guide](https://github.com/ISpillMyDrink/UEFI-Repair-Guide) | `—` | `101` | Wiki on some important things related to firmware, specifically aimed at repair shops and the likes of it. |
| [schooldropout1337/dork](https://github.com/schooldropout1337/dork) | `Python` | `67` | Sin descripción |
| [Daniel0110000/DeepCodeStudio](https://github.com/Daniel0110000/DeepCodeStudio) | `Kotlin` | `52` | Assembly code editor |
| [sammwyy/dissect](https://github.com/sammwyy/dissect) | `TypeScript` | `11` | Universal binary patcher and disassembler in the browser |

### Seguridad Móvil, Android & Reversing Móvil (66 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [Genymobile/scrcpy](https://github.com/Genymobile/scrcpy) | `C` | `149,262` | Display and control your Android device |
| [rustdesk/rustdesk](https://github.com/rustdesk/rustdesk) | `Rust` | `123,028` | An open-source remote desktop application designed for self-hosting, as an alternative to TeamViewer. |
| [Hack-with-Github/Awesome-Hacking](https://github.com/Hack-with-Github/Awesome-Hacking) | `—` | `120,053` | A collection of various awesome lists for hackers, pentesters and security researchers |
| [topjohnwu/Magisk](https://github.com/topjohnwu/Magisk) | `Kotlin` | `62,666` | The Magic Mask for Android |
| [skylot/jadx](https://github.com/skylot/jadx) | `Java` | `50,396` | Dex to Java decompiler |
| [KRTirtho/spotube](https://github.com/KRTirtho/spotube) | `Dart` | `49,042` | 🎧 Open source music streaming app! Available for both desktop & mobile! |
| [TeamNewPipe/NewPipe](https://github.com/TeamNewPipe/NewPipe) | `Java` | `39,637` | A libre lightweight streaming front-end for Android. |
| [RikkaApps/Shizuku](https://github.com/RikkaApps/Shizuku) | `Kotlin` | `29,935` | Using system APIs directly with adb/root privileges from normal apps through a Java process started with app_process. |
| [JunkFood02/Seal](https://github.com/JunkFood02/Seal) | `Kotlin` | `28,855` | 🦭 Video/Audio Downloader for Android, based on yt-dlp |
| [MobSF/Mobile-Security-Framework-MobSF](https://github.com/MobSF/Mobile-Security-Framework-MobSF) | `JavaScript` | `21,733` | Mobile Security Framework (MobSF) is an automated, all-in-one mobile application (Android/iOS/Windows) pen-testing, malware ana... |
| [tiann/KernelSU](https://github.com/tiann/KernelSU) | `Kotlin` | `18,306` | A Kernel based root solution for Android |
| [budtmo/docker-android](https://github.com/budtmo/docker-android) | `Python` | `15,840` | Android in docker solution with noVNC supported, video recording and mcp server |
| [FreeRDP/FreeRDP](https://github.com/FreeRDP/FreeRDP) | `C` | `13,666` | FreeRDP is a free remote desktop protocol library and clients |
| [libre-tube/LibreTube](https://github.com/libre-tube/LibreTube) | `Kotlin` | `12,672` | An alternative frontend for YouTube, for Android. |
| [mzlogin/awesome-adb](https://github.com/mzlogin/awesome-adb) | `—` | `12,437` | ADB Usage Complete / ADB 用法大全 |
| [recloudstream/cloudstream](https://github.com/recloudstream/cloudstream) | `Kotlin` | `10,630` | Android app for streaming and downloading media. |
| [d4rken-org/sdmaid-se](https://github.com/d4rken-org/sdmaid-se) | `Kotlin` | `7,497` | SD Maid 2/SE is Android's most thorough cleaning tool. |
| [aistra0528/Hail](https://github.com/aistra0528/Hail) | `Kotlin` | `6,635` | Disable / Hide / Suspend / Uninstall Android apps without root. |
| [TeamAmaze/AmazeFileManager](https://github.com/TeamAmaze/AmazeFileManager) | `Kotlin` | `6,378` | Material design file manager for Android |
| [LSPosed/LSPosed.github.io](https://github.com/LSPosed/LSPosed.github.io) | `HTML` | `6,333` | Sin descripción |
| [AzeemIdrisi/PhoneSploit-Pro](https://github.com/AzeemIdrisi/PhoneSploit-Pro) | `Python` | `6,241` | An all-in-one hacking tool to remotely take over Android devices. |
| [z-huang/InnerTune](https://github.com/z-huang/InnerTune) | `Kotlin` | `6,076` | A Material 3 YouTube Music client for Android |
| [samolego/Canta](https://github.com/samolego/Canta) | `Kotlin` | `5,828` | Uninstall any Android app without root (with power of Shizuku). Debloat your device as you wish, no PC required. |
| [thedjchi/Shizuku](https://github.com/thedjchi/Shizuku) | `Kotlin` | `5,633` | Using system APIs directly with adb/root privileges from normal apps through a Java process started with app_process. |
| [simondankelmann/Bluetooth-LE-Spam](https://github.com/simondankelmann/Bluetooth-LE-Spam) | `Kotlin` | `4,918` | Sin descripción |
| [Swordfish90/Lemuroid](https://github.com/Swordfish90/Lemuroid) | `Kotlin` | `4,303` | All in one emulator on Android! |
| [gokadzev/Musify](https://github.com/gokadzev/Musify) | `Dart` | `4,218` | Unlock the full potential of music: Stream effortlessly with one app! |
| [RikkaApps/Sui](https://github.com/RikkaApps/Sui) | `Java` | `4,192` | Modern super user interface implementation on Android. |
| [iamr0s/Dhizuku](https://github.com/iamr0s/Dhizuku) | `Kotlin` | `3,801` | A tool that can share DeviceOwner permissions to other application. |
| [ssut/payload-dumper-go](https://github.com/ssut/payload-dumper-go) | `Go` | `3,509` | an android OTA payload dumper written in Go |
| [deltazefiro/Amarok-Hider](https://github.com/deltazefiro/Amarok-Hider) | `Java` | `3,240` | Hide your private files and apps with a single click. |
| [PartialVolume/shredos.x86_64](https://github.com/PartialVolume/shredos.x86_64) | `Makefile` | `3,156` | Shredos Disk Eraser 64 bit for all Intel 64 bit processors as well as processors from AMD and other vendors which make compatib... |
| [anandnet/Harmony-Music](https://github.com/anandnet/Harmony-Music) | `Dart` | `3,080` | A cross platform App for streaming Music |
| [tegal1337/CiLocks](https://github.com/tegal1337/CiLocks) | `HTML` | `3,002` | Crack Interface lockscreen, Metasploit and More Android/IOS Hacking |
| [whyorean/AuroraStore](https://github.com/whyorean/AuroraStore) | `Kotlin` | `2,959` | Sin descripción |
| [noob-hackers/ipdrone](https://github.com/noob-hackers/ipdrone) | `Python` | `2,156` | Track Location With Live Address And Accuracy In Termux |
| [ravindu644/Droidspaces-OSS](https://github.com/ravindu644/Droidspaces-OSS) | `Kotlin` | `1,889` | A lightweight, LXC-like container runtime for Android and Linux. Run full Linux distributions natively with zero performance pe... |
| [HACK3RY2J/Anon-SMS](https://github.com/HACK3RY2J/Anon-SMS) | `Shell` | `1,607` | A Tool To Send Messages Anonymously.. |
| [zalexdev/strykerapp](https://github.com/zalexdev/strykerapp) | `Java` | `1,532` | Magic tool for pentest from your android device! |
| [sayaka-sh/spmp](https://github.com/sayaka-sh/spmp) | `Kotlin` | `1,449` | SpMp has been succeeded by Kanon, see README --- A YouTube Music client with a focus on customisation of colours and song metad... |
| [BobbyESP/Spowlo](https://github.com/BobbyESP/Spowlo) | `Kotlin` | `1,370` | A Spotify songs downloader for Android made with Jetpack Compose, Material You and the spotDL Python library |
| [WSTxda/ViperFX-RE-Releases](https://github.com/WSTxda/ViperFX-RE-Releases) | `—` | `1,277` | ViPER4Android FX with Material 3 Expressive design and improvements. |
| [googlesamples/android-testdpc](https://github.com/googlesamples/android-testdpc) | `Java` | `1,037` | Test DPC is a sample device policy controller for use with Android Enterprise. It gives developers the ability to see how their... |
| [mishakorzik/IpHack](https://github.com/mishakorzik/IpHack) | `Shell` | `907` | Track Location With Live Address And City in Termux |
| [nohajc/termux-adb](https://github.com/nohajc/termux-adb) | `Shell` | `835` | Run adb in Termux without root permissions! |
| [YuvrajRaghuvanshiS/WhatsApp-Key-Database-Extractor](https://github.com/YuvrajRaghuvanshiS/WhatsApp-Key-Database-Extractor) | `Python` | `560` | The most advanced and complete solution for extracting WhatsApp key/DB from package directory (/data/data/com.whatsapp) without... |
| [keepandroidopen/keepandroidopen.github.io](https://github.com/keepandroidopen/keepandroidopen.github.io) | `HTML` | `460` | Resisting Google's Android developer verification mandate |
| [whitebelyash/AdrenoToolsDrivers](https://github.com/whitebelyash/AdrenoToolsDrivers) | `Shell` | `437` | Highly unstable & sloppy AdrenoTools Turnip builds - use with caution. Targetted at better A8XX support. |
| [ivan-sincek/ios-penetration-testing-cheat-sheet](https://github.com/ivan-sincek/ios-penetration-testing-cheat-sheet) | `JavaScript` | `423` | Work in progress... |
| [U7P4L-IN/WIFI-HACKING](https://github.com/U7P4L-IN/WIFI-HACKING) | `Python` | `321` | ⚡Cyber Security Tool For Hacking Wireless Connections Using Built-In Kali Tools. Supports All Securities (WEP, WPS, WPA, WPA2/T... |
| [gch1p/thinkpad-bios-software-flashing-guide](https://github.com/gch1p/thinkpad-bios-software-flashing-guide) | `Perl` | `295` | flashing coreboot on thinkpads without external programmer |
| [shynoiddev/FireWall-Blocks](https://github.com/shynoiddev/FireWall-Blocks) | `Kotlin` | `224` | Android firewall app using Shizuku and VPN modes. and no root required. This app can block internet access of any other apps.  |
| [4osp3l/Phone](https://github.com/4osp3l/Phone) | `Python` | `216` | Phone: A Mobile Phone Forensic Framework ( Android ) |
| [LineageOS/android_kernel_xiaomi_sdm845](https://github.com/LineageOS/android_kernel_xiaomi_sdm845) | `C` | `178` | Sin descripción |
| [LineageOS/android_kernel_xiaomi_sm8250](https://github.com/LineageOS/android_kernel_xiaomi_sm8250) | `C` | `148` | Sin descripción |
| [polygraphene/gunyah-on-sd-guide](https://github.com/polygraphene/gunyah-on-sd-guide) | `Shell` | `146` | A guide to use gunyah VM on Android snapdragon devices with crosvm |
| [WaifuPX-DG/WaifuPX](https://github.com/WaifuPX-DG/WaifuPX) | `—` | `143` | Android App Anime Wallpapers Material Design |
| [AiGptCode/AiGPT-WordPress-Exploitation-Framework](https://github.com/AiGptCode/AiGPT-WordPress-Exploitation-Framework) | `Python` | `133` | AiGPT started from the concept of CVE‑2024‑27956 , the WP Automatic CSV injection — but has been completely rebuilt into a mult... |
| [cyberboyplas/WhSms](https://github.com/cyberboyplas/WhSms) | `Shell` | `119` | Send SMS anonymously, with personalized text. Programmed by WhBeatZ |
| [vikas2210p/phonelock](https://github.com/vikas2210p/phonelock) | `HTML` | `79` | *phonelock* is a phishing attacks Tools help for hack Android password  |
| [watchtowrlabs/fortios-auth-bypass-poc-CVE-2024-55591](https://github.com/watchtowrlabs/fortios-auth-bypass-poc-CVE-2024-55591) | `Python` | `77` | Sin descripción |
| [mahendraplus/B4Bomber](https://github.com/mahendraplus/B4Bomber) | `Shell` | `67` | B4Bomber is a powerful tool designed to send OTPs in bulk, make calls, and protect your number from being bombarded by other si... |
| [Windroidcc/MandoSudo](https://github.com/Windroidcc/MandoSudo) | `—` | `18` | MandoSudo es una aplicación que convierte tu teléfono Android en un mando virtual para controlar juegos en Linux o Windows medi... |
| [JesusChapman/termux-adb](https://github.com/JesusChapman/termux-adb) | `—` | `8` | Run adb in Termux without root permissions! |
| [Arturo254/AndroidIDE](https://github.com/Arturo254/AndroidIDE) | `Java` | `4` | AndroidIDE es un IDE para Android para desarrollar aplicaciones de Android con todas las funciones. |
| [samVent2/wipwn-mejorado](https://github.com/samVent2/wipwn-mejorado) | `Python` | `1` | Generador de PINs WPS con Auto-Attack \| 76 Algoritmos Verificables \| 100% Español \| 100% Open Source |

### Herramientas Generales de Pentesting & Exploits (17 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [Atlas-OS/Atlas](https://github.com/Atlas-OS/Atlas) | `Batchfile` | `21,496` | 🚀 An open and lightweight modification to Windows, designed to optimize performance, privacy and usability. |
| [SWE-agent/SWE-agent](https://github.com/SWE-agent/SWE-agent) | `Python` | `20,292` | SWE-agent takes a GitHub issue and tries to automatically fix it, using your LM of choice. It can also be employed for offensiv... |
| [prowler-cloud/prowler](https://github.com/prowler-cloud/prowler) | `Python` | `14,781` | Prowler is the world’s most widely used open-source cloud security platform that automates security and compliance across any c... |
| [gophish/gophish](https://github.com/gophish/gophish) | `Go` | `14,198` | Open-Source Phishing Toolkit |
| [Netflix/zuul](https://github.com/Netflix/zuul) | `Java` | `14,073` | Zuul is a gateway service that provides dynamic routing, monitoring, resiliency, security, and more. |
| [lc/gau](https://github.com/lc/gau) | `Go` | `5,087` | Fetch known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, and Common Crawl. |
| [Bo0oM/fuzz.txt](https://github.com/Bo0oM/fuzz.txt) | `—` | `3,325` | Potentially dangerous files |
| [projectdiscovery/vulnx](https://github.com/projectdiscovery/vulnx) | `Go` | `2,656` | Modern CLI for exploring vulnerability data with powerful search, filtering, and analysis capabilities. |
| [s0md3v/uro](https://github.com/s0md3v/uro) | `Python` | `1,590` | declutters url lists for crawling/pentesting |
| [micro-joan/BlackStone](https://github.com/micro-joan/BlackStone) | `CSS` | `601` | Pentesting Reporting Tool |
| [francisconeves97/jxscout](https://github.com/francisconeves97/jxscout) | `JavaScript` | `473` | jxscout superpowers JavaScript analysis for security researchers |
| [De3vil/KLogger](https://github.com/De3vil/KLogger) | `Python` | `296` | Remote persistent 🔑Logger for Windows and Linux |
| [xhzeem/toxicache](https://github.com/xhzeem/toxicache) | `Go` | `150` |  Go scanner to find web cache poisoning vulnerabilities in a list of URLs |
| [mrdesoky0/vulnerabilities](https://github.com/mrdesoky0/vulnerabilities) | `Python` | `82` | Sin descripción |
| [Whapi-Cloud/whatsapp-checker](https://github.com/Whapi-Cloud/whatsapp-checker) | `TypeScript` | `65` | This checker is designed to check numbers for whatsapp installed on them. Validate any numbers from any country. Identify which... |
| [TheCyberpunker/houseHole](https://github.com/TheCyberpunker/houseHole) | `TypeScript` | `36` | Househole prioritizes privacy, security, and control, while helping users remain undetected by services that identify temporary... |
| [TechnoHacks181/formsgooglebot](https://github.com/TechnoHacks181/formsgooglebot) | `Python` | `3` | bot para responder encuestas en google forms automatica  |

### Metodologías, Cheat Sheets & Laboratorios CTF (22 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [trimstray/the-book-of-secret-knowledge](https://github.com/trimstray/the-book-of-secret-knowledge) | `—` | `242,926` | A collection of inspiring lists, manuals, cheatsheets, blogs, hacks, one-liners, cli/web tools and more. |
| [obsproject/obs-studio](https://github.com/obsproject/obs-studio) | `C` | `76,014` | OBS Studio - Free and open source software for live streaming and screen recording |
| [prakhar1989/awesome-courses](https://github.com/prakhar1989/awesome-courses) | `—` | `71,018` | :books: List of awesome university courses for learning Computer Science! |
| [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts) | `CSS` | `64,562` | Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections:... |
| [astral-sh/ruff](https://github.com/astral-sh/ruff) | `Rust` | `49,569` | An extremely fast Python linter and code formatter, written in Rust. |
| [chubin/cheat.sh](https://github.com/chubin/cheat.sh) | `Python` | `41,734` | the only cheat sheet you need |
| [LAION-AI/Open-Assistant](https://github.com/LAION-AI/Open-Assistant) | `Python` | `37,397` | OpenAssistant is a chat-based assistant that understands tasks, can interact with third-party systems, and retrieve information... |
| [openai/gpt-2](https://github.com/openai/gpt-2) | `Python` | `25,012` | Code for the paper "Language Models are Unsupervised Multitask Learners" |
| [lissy93/personal-security-checklist](https://github.com/lissy93/personal-security-checklist) | `TypeScript` | `22,291` | 🔒 A compiled checklist of 300+ tips for protecting digital security and privacy in 2026 |
| [linuxserver/Heimdall](https://github.com/linuxserver/Heimdall) | `PHP` | `9,314` | An Application dashboard and launcher |
| [Ignitetechnologies/Mindmap](https://github.com/Ignitetechnologies/Mindmap) | `—` | `9,256` | This repository will contain many mindmaps for cyber security technologies, methodologies, courses, and certifications in a tre... |
| [hackerschoice/thc-tips-tricks-hacks-cheat-sheet](https://github.com/hackerschoice/thc-tips-tricks-hacks-cheat-sheet) | `Shell` | `3,883` | Various tips & tricks |
| [yudataguy/awesome-japanese](https://github.com/yudataguy/awesome-japanese) | `JavaScript` | `2,332` | Awesome Japanese Learning Resources |
| [theowni/Damn-Vulnerable-RESTaurant-API-Game](https://github.com/theowni/Damn-Vulnerable-RESTaurant-API-Game) | `Python` | `935` | Damn Vulnerable Restaurant is an intentionally vulnerable Web API game for learning and training purposes dedicated to develope... |
| [nbfc-linux/nbfc-linux](https://github.com/nbfc-linux/nbfc-linux) | `C` | `779` | NoteBook FanControl ported to Linux |
| [paralax/awesome-cybersecurity-internships](https://github.com/paralax/awesome-cybersecurity-internships) | `—` | `587` | a list of cybersecurity internships |
| [alihussainzada/BugHunterMethodology](https://github.com/alihussainzada/BugHunterMethodology) | `—` | `164` | A comprehensive bug bounty methodology compiled from extensive research, covering web application reconnaissance, checklists, a... |
| [DhanushNehru/Ultimate-Cybersecurity-Resources](https://github.com/DhanushNehru/Ultimate-Cybersecurity-Resources) | `—` | `163` | A collection of cybersecurity resources for hackers, pentesters and security researchers |
| [lavclash75/htb_app](https://github.com/lavclash75/htb_app) | `JavaScript` | `9` | A lightweight Electron wrapper for Hack The Box with a native-like desktop experience, in-app settings, auto-updates, and a few... |
| [Abynet/Practical-Ethical-Hacking-Resources](https://github.com/Abynet/Practical-Ethical-Hacking-Resources) | `—` | `3` | Compilation of Resources from TCM's Practical Ethical Hacking Udemy Course  |
| [drakvyn/open-vault](https://github.com/drakvyn/open-vault) | `—` | `2` | This is a personal yet open vault of resources, courses, tools, and more; I hope it's useful for someone besides myself |
| [latorrents/ai-job-search](https://github.com/latorrents/ai-job-search) | `—` | `1` | The job search that runs on your machine. AI job application framework built on Claude Code: evaluate postings, tailor CVs, wri... |

### Linux, Dotfiles, Ricing & Productividad Terminal (45 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [freeCodeCamp/freeCodeCamp](https://github.com/freeCodeCamp/freeCodeCamp) | `TypeScript` | `455,224` | freeCodeCamp.org's open-source codebase and curriculum. Learn math, programming, and computer science for free. |
| [alacritty/alacritty](https://github.com/alacritty/alacritty) | `Rust` | `65,666` | A cross-platform, OpenGL terminal emulator. |
| [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k) | `Shell` | `55,072` | A Zsh theme |
| [hyprwm/Hyprland](https://github.com/hyprwm/Hyprland) | `C++` | `38,480` | Hyprland is an independent, highly customizable, dynamic tiling Wayland compositor that doesn't sacrifice on its looks. |
| [kovidgoyal/kitty](https://github.com/kovidgoyal/kitty) | `Python` | `34,842` | If you live in the terminal, kitty is made for you! Cross-platform, fast, feature-rich, GPU based. |
| [obsidianmd/obsidian-releases](https://github.com/obsidianmd/obsidian-releases) | `—` | `21,433` | Community plugins list, theme list, and releases of Obsidian. |
| [davatorium/rofi](https://github.com/davatorium/rofi) | `C` | `16,377` | Rofi: A window switcher, application launcher and dmenu replacement |
| [polybar/polybar](https://github.com/polybar/polybar) | `C++` | `15,339` | A fast and easy-to-use status bar |
| [TomSchimansky/CustomTkinter](https://github.com/TomSchimansky/CustomTkinter) | `Python` | `13,543` | A modern and customizable python UI-library based on Tkinter |
| [kautukkundan/Awesome-Profile-README-templates](https://github.com/kautukkundan/Awesome-Profile-README-templates) | `JavaScript` | `11,194` | A collection of awesome readme templates to display on your profile |
| [cotes2020/jekyll-theme-chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) | `HTML` | `10,255` | A minimal, responsive, and feature-rich Jekyll theme for technical writing. |
| [Orbmu2k/nvidiaProfileInspector](https://github.com/Orbmu2k/nvidiaProfileInspector) | `C#` | `7,203` | Sin descripción |
| [gh0stzk/dotfiles](https://github.com/gh0stzk/dotfiles) | `Shell` | `4,730` | BSPWM environment with 18 themes. With a theme selector to change on the fly. |
| [Lxtharia/minegrub-theme](https://github.com/Lxtharia/minegrub-theme) | `Python` | `4,600` | A Grub Theme in the style of Minecraft! |
| [dempfi/ayu](https://github.com/dempfi/ayu) | `Jupyter Notebook` | `4,416` | 🎨🖌 Modern, bright color theme for Sublime Text |
| [raexera/yoru](https://github.com/raexera/yoru) | `Lua` | `3,576` | A custom Linux environment built on AwesomeWM |
| [Aylur/dotfiles](https://github.com/Aylur/dotfiles) | `Nix` | `3,099` | My personal config files |
| [betterlockscreen/betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) | `Shell` | `2,652` | 🍀 sweet looking lockscreen for linux system |
| [cocopon/iceberg.vim](https://github.com/cocopon/iceberg.vim) | `Vim Script` | `2,383` | :antarctica: Bluish color scheme for Vim and Neovim |
| [sddm/sddm](https://github.com/sddm/sddm) | `C++` | `2,347` | QML based X11 and Wayland display manager |
| [linuxdotexe/nordic-wallpapers](https://github.com/linuxdotexe/nordic-wallpapers) | `Python` | `1,860` | A collection of wallpapers that go well with the rices inspired by the Nord Colorscheme. Made with ImageGoNord by Schrödinger Hat. |
| [CollapseLauncher/Collapse](https://github.com/CollapseLauncher/Collapse) | `C#` | `1,780` | An Advanced Launcher for miHoYo/HoYoverse Games |
| [maboroshin/qBittorrentDarktheme](https://github.com/maboroshin/qBittorrentDarktheme) | `HTML` | `1,248` | qBittorrent Dark theme |
| [eylles/pywal16](https://github.com/eylles/pywal16) | `Python` | `800` | 16 colors fork of pywal |
| [davatorium/rofi-themes](https://github.com/davatorium/rofi-themes) | `CSS` | `603` | Themes for Rofi |
| [r1vs3c/auto-bspwm](https://github.com/r1vs3c/auto-bspwm) | `Shell` | `526` | Bash script that automates the setup of a professional hacking environment for Kali Linux using the tiled window manager bspwm. |
| [kiddae/polybar-themes](https://github.com/kiddae/polybar-themes) | `Shell` | `433` | (Deprecated) A repository of themes for polybar. |
| [voidlhf/StarRailGrubThemes](https://github.com/voidlhf/StarRailGrubThemes) | `Nix` | `389` | A pack of GRUB2 themes for Honkai: Star Rail |
| [ikz87/dots-2.0](https://github.com/ikz87/dots-2.0) | `Shell` | `331` | eww + bspwm rice c: |
| [yorkox0/autoBspwm](https://github.com/yorkox0/autoBspwm) | `Python` | `305` | Este script añade la config de s4vitar a bspwm automaticamente! |
| [aceofkittens/Auto-PWE](https://github.com/aceofkittens/Auto-PWE) | `Shell` | `243` | Script en Bash que te permite convertir una distribución de Linux en un entorno de trabajo profesional de manera automática. |
| [xJackSx/BSPWMparrot](https://github.com/xJackSx/BSPWMparrot) | `HTML` | `210` | Sin descripción |
| [kiddae/dotfiles](https://github.com/kiddae/dotfiles) | `Python` | `201` | Files that start with a dot (they're very cool). |
| [niraj998/Rofi-Scripts](https://github.com/niraj998/Rofi-Scripts) | `Shell` | `180` | Useful Rofi Scripts |
| [MrVivekRajan/Grub-Themes](https://github.com/MrVivekRajan/Grub-Themes) | `Shell` | `129` | Sin descripción |
| [WaifuPX-DG/UtopiaWalls](https://github.com/WaifuPX-DG/UtopiaWalls) | `—` | `55` | Wallpapers of varied styles in a beautiful app |
| [AlguienSasaki/Dotfiles](https://github.com/AlguienSasaki/Dotfiles) | `Shell` | `41` | My bspwm configs in Arch Linux |
| [K4ySuh/Kali-AutoBSPWM](https://github.com/K4ySuh/Kali-AutoBSPWM) | `Shell` | `39` | Bash script that perform all the setup for BSPWM installation, including polybar, picom, pywal,nvchad, with multiple color sche... |
| [Kaxxia/Wallpapers](https://github.com/Kaxxia/Wallpapers) | `—` | `24` | My collection of desktop wallpapers  |
| [killhellokitty/Cloak-3.22](https://github.com/killhellokitty/Cloak-3.22) | `CSS` | `23` | A black transparent theme for Gtk-3.22 |
| [TechnicalDC/dotfiles](https://github.com/TechnicalDC/dotfiles) | `CSS` | `10` | Sin descripción |
| [JesusChapman/wallpaper-downloader](https://github.com/JesusChapman/wallpaper-downloader) | `C++` | `4` | A Qt Widgets client for download wallpapers using Qt Frameworks and Wallhaven API |
| [uGeek/wallpapers](https://github.com/uGeek/wallpapers) | `—` | `3` | Just some neat looking wallpapers (2560px × 1440px) |
| [xonlinex/bspwm-dots](https://github.com/xonlinex/bspwm-dots) | `Shell` | `2` | Sin descripción |
| [253AA/blackarch-install-dotfiles](https://github.com/253AA/blackarch-install-dotfiles) | `Shell` | `1` | Instalacion y personalizacion de blackarch desde cero |

### Hardware, Drivers & Optimización de Sistema (Acer/Linux) (15 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [oguzhaninan/Stacer](https://github.com/oguzhaninan/Stacer) | `C++` | `9,320` | Linux System Optimizer and Monitoring - https://oguzhaninan.github.io/Stacer-Web |
| [boltgolt/howdy](https://github.com/boltgolt/howdy) | `Python` | `7,763` | 🛡️ Windows Hello™ style facial authentication for Linux |
| [v4l2loopback/v4l2loopback](https://github.com/v4l2loopback/v4l2loopback) | `C` | `4,236` | v4l2-loopback device  |
| [hirschmann/nbfc](https://github.com/hirschmann/nbfc) | `C#` | `3,222` | NoteBook FanControl |
| [thewhiteh4t/FinalRecon](https://github.com/thewhiteh4t/FinalRecon) | `Python` | `2,966` | All In One Web Recon |
| [PXDiv/Div-Acer-Manager-Max](https://github.com/PXDiv/Div-Acer-Manager-Max) | `C#` | `700` | Div Acer Manager Max is a Linux GUI for Acer laptops using Linuwu Sense drivers. It replicates NitroSense functionality with fa... |
| [JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module](https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module) | `C` | `622` | Linux kernel module to support Turbo mode and RGB Keyboard for Acer Predator notebook series |
| [rhboot/efibootmgr](https://github.com/rhboot/efibootmgr) | `C` | `592` | efibootmgr development tree |
| [Packss/Linux-NitroSense](https://github.com/Packss/Linux-NitroSense) | `Python` | `128` | Clone of Acer's NitroSense™ application for Linux. |
| [daringer/asus-fan](https://github.com/daringer/asus-fan) | `C` | `97` | Kernel module to get/set (both) fan speed(s) on ASUS Zenbooks |
| [PXDiv/Div-Acer-Manager-Fan-Controls](https://github.com/PXDiv/Div-Acer-Manager-Fan-Controls) | `HTML` | `76` | Fan control and thermal management suite for Acer Nitro & Predator laptops on Linux. Features secure WMI-based driver, intellig... |
| [kphanipavan/PredatorNonSense](https://github.com/kphanipavan/PredatorNonSense) | `Python` | `44` | Clone of Acer's Predator Sense™ application for fan control on Linux |
| [snowyoneill/Linux-PredatorSense](https://github.com/snowyoneill/Linux-PredatorSense) | `Python` | `32` | Clone of Acer's Predator Sense™ application for Linux. |
| [enesuzun2002/acer-nitro-5-an515-linux](https://github.com/enesuzun2002/acer-nitro-5-an515-linux) | `Shell` | `12` | Acer Nitro 5 (AN515) Linux Fixes |
| [PXDiv/AcerLinuxManager](https://github.com/PXDiv/AcerLinuxManager) | `Python` | `11` | A driver for controlling functions on Acer Nitro series laptops, includes a basic graphical user interface. |

### Desarrollo de Software, Automatización & Herramientas CLI (73 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [openclaw/openclaw](https://github.com/openclaw/openclaw) | `TypeScript` | `389,320` | The AI that really does things. Any OS. Any Platform. The lobster way. 🦞  |
| [yt-dlp/yt-dlp](https://github.com/yt-dlp/yt-dlp) | `Python` | `190,035` | A feature-rich command-line audio/video downloader |
| [ollama/ollama](https://github.com/ollama/ollama) | `Go` | `180,541` | Get up and running with Kimi-K2.6, GLM-5.2, MiniMax, DeepSeek, gpt-oss, Qwen, Gemma and other models. |
| [open-webui/open-webui](https://github.com/open-webui/open-webui) | `Python` | `151,489` | User-friendly AI Interface (Supports Ollama, OpenAI API, ...) |
| [godotengine/godot](https://github.com/godotengine/godot) | `C++` | `116,890` | Godot Engine – Multi-platform 2D and 3D game engine |
| [florinpop17/app-ideas](https://github.com/florinpop17/app-ideas) | `—` | `97,436` | A Collection of application ideas which can be used to improve your coding skills. |
| [3b1b/manim](https://github.com/3b1b/manim) | `Python` | `93,656` | Animation engine for explanatory math videos |
| [home-assistant/core](https://github.com/home-assistant/core) | `Python` | `90,352` | :house_with_garden: Open source home automation that puts local control and privacy first. |
| [astral-sh/uv](https://github.com/astral-sh/uv) | `Rust` | `89,670` | An extremely fast Python package and project manager, written in Rust. |
| [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit) | `Go` | `82,180` | simple terminal UI for git commands |
| [LadybirdBrowser/ladybird](https://github.com/LadybirdBrowser/ladybird) | `C++` | `66,125` | Truly independent web browser |
| [ChrisTitusTech/winutil](https://github.com/ChrisTitusTech/winutil) | `PowerShell` | `62,321` | Chris Titus Tech's Windows Utility - Install Programs, Tweaks, Fixes, and Updates |
| [upscayl/upscayl](https://github.com/upscayl/upscayl) | `TypeScript` | `49,123` | 🆙 Upscayl - #1 Free and Open Source AI Image Upscaler for Linux, MacOS and Windows. |
| [qbittorrent/qBittorrent](https://github.com/qbittorrent/qBittorrent) | `C++` | `40,015` | qBittorrent BitTorrent client |
| [httpie/cli](https://github.com/httpie/cli) | `Python` | `38,489` | 🥧 HTTPie CLI  — modern, user-friendly command-line HTTP client for the API era. JSON support, colors, sessions, downloads, plug... |
| [pear-devs/pear-desktop](https://github.com/pear-devs/pear-desktop) | `TypeScript` | `33,435` | Pear 🍐 is extension for music player |
| [FreeCAD/FreeCAD](https://github.com/FreeCAD/FreeCAD) | `C++` | `33,398` | Official source code of FreeCAD, a free and opensource multiplatform 3D parametric modeler. |
| [Devolutions/UniGetUI](https://github.com/Devolutions/UniGetUI) | `C#` | `26,078` | UniGetUI: The Graphical Interface for your package managers. Could be terribly described as a package manager manager to manage... |
| [fastfetch-cli/fastfetch](https://github.com/fastfetch-cli/fastfetch) | `C` | `24,578` | A maintained, feature-rich and performance oriented, neofetch like system information tool. |
| [eza-community/eza](https://github.com/eza-community/eza) | `Rust` | `23,206` | A modern alternative to ls |
| [xtermjs/xterm.js](https://github.com/xtermjs/xterm.js) | `TypeScript` | `21,160` | A terminal for the web |
| [stackblitz-labs/bolt.diy](https://github.com/stackblitz-labs/bolt.diy) | `TypeScript` | `19,858` | Prompt, run, edit, and deploy full-stack web applications using any LLM you want! |
| [ppy/osu](https://github.com/ppy/osu) | `C#` | `19,015` | rhythm is just a *click* away! |
| [AgriciDaniel/claude-seo](https://github.com/AgriciDaniel/claude-seo) | `Python` | `16,670` | Universal SEO skill for Claude Code. 25 sub-skills + 18 sub-agents covering technical SEO, E-E-A-T, schema, GEO/AEO, backlinks,... |
| [lsd-rs/lsd](https://github.com/lsd-rs/lsd) | `Rust` | `16,215` | The next gen ls command |
| [rust-lang/cargo](https://github.com/rust-lang/cargo) | `Rust` | `15,462` | The Rust package manager |
| [transmission/transmission](https://github.com/transmission/transmission) | `C++` | `15,182` | Official Transmission BitTorrent client repository |
| [kopia/kopia](https://github.com/kopia/kopia) | `Go` | `14,078` | Cross-platform backup tool for Windows, macOS & Linux with fast, incremental backups, client-side end-to-end encryption, compre... |
| [uiverse-io/galaxy](https://github.com/uiverse-io/galaxy) | `HTML` | `12,633` | The largest Open-Source UI Library! Community-made and free to use. Made with either CSS or Tailwind. |
| [encoredev/encore](https://github.com/encoredev/encore) | `Go` | `12,349` | The infrastructure platform for the intelligence era |
| [Heroic-Games-Launcher/HeroicGamesLauncher](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher) | `TypeScript` | `12,172` | A games launcher for GOG, Amazon and Epic Games for Linux, Windows and macOS. |
| [giscus/giscus](https://github.com/giscus/giscus) | `TypeScript` | `12,087` | A commenting system powered by GitHub Discussions. :octocat: :speech_balloon: :gem: |
| [Gogh-Co/Gogh](https://github.com/Gogh-Co/Gogh) | `Shell` | `10,311` | Gogh is a collection of color schemes for various terminal emulators, including Gnome Terminal, Pantheon Terminal, Tilix, and X... |
| [Abdenasser/neohtop](https://github.com/Abdenasser/neohtop) | `Svelte` | `9,357` | 💪🏻 Blazing-fast system monitoring for your desktop (built with Rust, Tauri & Svelte) |
| [ccxt/binance-trade-bot](https://github.com/ccxt/binance-trade-bot) | `Python` | `8,757` | Automated cryptocurrency trading bot |
| [AdnanHodzic/auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq) | `Python` | `7,754` | Automatic CPU speed & power optimizer for Linux |
| [busyloop/lolcat](https://github.com/busyloop/lolcat) | `Ruby` | `6,573` | Rainbows and unicorns! |
| [hyperknot/openfreemap](https://github.com/hyperknot/openfreemap) | `Python` | `5,956` | Free and open-source map hosting solution with custom styles for websites and apps, using OpenStreetMap data |
| [SWE-bench/SWE-bench](https://github.com/SWE-bench/SWE-bench) | `Python` | `5,813` | SWE-bench: Can Language Models Resolve Real-world Github Issues? |
| [jellyfin/jellyfin-desktop](https://github.com/jellyfin/jellyfin-desktop) | `C++` | `5,728` | Jellyfin Desktop Client |
| [hugomd/parrot.live](https://github.com/hugomd/parrot.live) | `JavaScript` | `4,469` | 🐦  Bringing animated parrots to terminals everywhere |
| [vogler/free-games-claimer](https://github.com/vogler/free-games-claimer) | `JavaScript` | `4,208` | Automatically claims free games and DLCs on the Epic Games Store, Amazon Prime Gaming and GOG. |
| [lay295/TwitchDownloader](https://github.com/lay295/TwitchDownloader) | `C#` | `3,916` | Twitch VOD/Clip Downloader - Chat Download/Render/Replay |
| [google-antigravity/antigravity-sdk-python](https://github.com/google-antigravity/antigravity-sdk-python) | `Python` | `3,343` | A Python library for building AI agents that leverage the full power of Google Antigravity. |
| [besuper/TwitchNoSub](https://github.com/besuper/TwitchNoSub) | `JavaScript` | `2,792` | An extension to watch sub only VOD on Twitch |
| [xnl-h4ck3r/waymore](https://github.com/xnl-h4ck3r/waymore) | `Python` | `2,741` | Find way more from the Wayback Machine, Common Crawl, Alien Vault OTX, URLScan, VirusTotal, GhostArchive & Intelligence X! |
| [EniasCailliau/GirlfriendGPT](https://github.com/EniasCailliau/GirlfriendGPT) | `Python` | `2,691` | OSS AI Companion Chatbot - Build your own AI companion in Python using ChatGPT. |
| [musana/CF-Hero](https://github.com/musana/CF-Hero) | `Go` | `2,637` | CF-Hero is a reconnaissance tool that uses multiple data sources to discover the origin IP addresses of Cloudflare-protected we... |
| [tomnomnom/gf](https://github.com/tomnomnom/gf) | `Go` | `2,139` | A wrapper around grep, to help you grep for things |
| [rgwood/systemctl-tui](https://github.com/rgwood/systemctl-tui) | `Rust` | `2,050` | A fast, simple TUI for interacting with systemd services and their logs |
| [evilsocket/nerve](https://github.com/evilsocket/nerve) | `Python` | `1,315` | The Simple Agent Development Kit. |
| [libsm64/libsm64](https://github.com/libsm64/libsm64) | `C` | `937` | Mario 64 as a library for use in external game engines |
| [Stremio/stremio-shell](https://github.com/Stremio/stremio-shell) | `C++` | `917` | 🐚 Qt5-based shell for Stremio; compile this to run the desktop app |
| [projectdiscovery/chaos-client](https://github.com/projectdiscovery/chaos-client) | `Go` | `883` | Go client to communicate with Chaos DB API.  |
| [stashapp/CommunityScrapers](https://github.com/stashapp/CommunityScrapers) | `YAML` | `835` | This is a public repository containing scrapers created by the Stash Community. |
| [Drive-Trust-Alliance/sedutil](https://github.com/Drive-Trust-Alliance/sedutil) | `C++` | `696` | DTA sedutil  Self encrypting drive software |
| [an-anime-team/anime-games-launcher](https://github.com/an-anime-team/anime-games-launcher) | `Rust` | `478` | Universal games launcher powered by luau scripts with in-house APIs |
| [utkusen/baitroute](https://github.com/utkusen/baitroute) | `Go` | `439` | A web honeypot library to create vulnerable-looking endpoints to detect and mislead attackers |
| [lanylow/genshin-utility](https://github.com/lanylow/genshin-utility) | `C++` | `189` | Utility tool for Genshin Impact and Honkai: Star Rail. |
| [MHaggis/ClickGrab](https://github.com/MHaggis/ClickGrab) | `HTML` | `156` | Finding ClickFix and FakeCAPTCHA like it's 1999 |
| [FofaInfo/GoFOFA](https://github.com/FofaInfo/GoFOFA) | `Go` | `118` | GoFOFA is a command-line tool for the FOFA API written in Golang. |
| [dannygaray60/funemustation](https://github.com/dannygaray60/funemustation) | `GDScript` | `76` | A simple but elegant launcher / frontend for emulators and pc games made with Godot Engine |
| [Dev-Diego/YaemoriBot-MD](https://github.com/Dev-Diego/YaemoriBot-MD) | `—` | `60` | 𝗕𝗶𝗲𝗻𝘃𝗲𝗻𝗶𝗱𝗼(𝗮)!! 𝗘𝘅𝗽𝗹𝗼𝗿𝗮 𝗲𝘀𝘁𝗲 𝗿𝗲𝗽𝗼𝘀𝗶𝘁𝗼𝗿𝗶𝗼, 𝗬𝗮𝗲𝗺𝗼𝗿𝗶𝗕𝗼𝘁-𝗠𝗗 🌻 𝗲𝘀 𝘂𝗻 𝗕𝗼𝘁 𝗱𝗲 𝗪𝗵𝗮𝘁𝘀𝗔𝗽𝗽 𝗲𝗻𝗳𝗼𝗰𝗮𝗱𝗼 𝗮 𝗹𝗮 𝗽𝗿𝗼𝗱𝘂𝗰𝘁𝗶𝘃𝗶𝗱𝗮𝗱 𝘆 𝗲𝗻𝘁𝗿𝗲𝘁𝗲𝗻𝗶𝗺𝗶𝗲𝗻𝘁𝗼. |
| [aarron-lee/crunchyroll-linux](https://github.com/aarron-lee/crunchyroll-linux) | `JavaScript` | `42` | Unofficial Crunchyroll TV/HTPC App for Linux |
| [ther0n/beefweb_mpris](https://github.com/ther0n/beefweb_mpris) | `Python` | `28` | A Python wrapper that adds MPRIS support to foobar2000 running in WINE on Linux through the beefweb component REST API |
| [bruno-sartori/weeb-logger](https://github.com/bruno-sartori/weeb-logger) | `HTML` | `20` | A visual logging tool with your favorite waifu |
| [kosail/Aria](https://github.com/kosail/Aria) | `Kotlin` | `13` | An ambient sounds app. Nature’s silent symphony. |
| [RichyKunBv/Mantenix-Linux-Edition](https://github.com/RichyKunBv/Mantenix-Linux-Edition) | `Shell` | `5` | Un script de terminal potente y amigable diseñado para simplificar el mantenimiento de tu sistema Linux. Con un menú interactiv... |
| [NexWan/MindScrap](https://github.com/NexWan/MindScrap) | `Python` | `4` | Mindbox scrapper for the ITS |
| [0xC1pher/API-Geolocalizacion-telefonos-moviles](https://github.com/0xC1pher/API-Geolocalizacion-telefonos-moviles) | `Python` | `4` | Es una herramienta que puedes usar para localizar telefonos moviles por 3 metodos distintos |
| [Juanelo53/Coinbase-API-PHP](https://github.com/Juanelo53/Coinbase-API-PHP) | `PHP` | `2` | Simple Class for API Coinbase in PHP 8.2 |
| [LimbersMay/changeTerminalWorkdir](https://github.com/LimbersMay/changeTerminalWorkdir) | `Python` | `1` | Simple terminal working directory changer CLI for Linux and Mac |
| [NexWan/zig-postgresql-wrapper](https://github.com/NexWan/zig-postgresql-wrapper) | `Zig` | `1` | A basic postgresql wrapped using libpq  |

### Miscelánea & Utilidades Generales (113 repositorios)

| Repositorio | Lenguaje | ⭐ Estrellas | Descripción |
| :--- | :---: | :---: | :--- |
| [torvalds/linux](https://github.com/torvalds/linux) | `C` | `247,654` | Linux kernel source tree |
| [microsoft/markitdown](https://github.com/microsoft/markitdown) | `Python` | `182,232` | Python tool for converting files and office documents to Markdown. |
| [jlevy/the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line) | `—` | `162,325` | Master the command line, in one page |
| [openai/whisper](https://github.com/openai/whisper) | `Python` | `108,809` | Robust Speech Recognition via Large-Scale Weak Supervision |
| [nomic-ai/gpt4all](https://github.com/nomic-ai/gpt4all) | `C++` | `77,380` | GPT4All: Run Local LLMs on Any Device. Open-source and available for commercial use. |
| [gorhill/uBlock](https://github.com/gorhill/uBlock) | `JavaScript` | `67,700` | uBlock Origin - An efficient blocker for Chromium and Firefox. Fast and lean. |
| [meta-llama/llama](https://github.com/meta-llama/llama) | `Python` | `59,603` | Inference code for Llama models |
| [moeru-ai/airi](https://github.com/moeru-ai/airi) | `TypeScript` | `48,997` | 💖🧸 Self hosted, you-owned Grok Companion, a container of souls of waifu, cyber livings to bring them into our worlds, wishing t... |
| [janhq/jan](https://github.com/janhq/jan) | `TypeScript` | `44,391` | Jan is an open source alternative to ChatGPT that runs 100% offline on your computer. |
| [mifi/lossless-cut](https://github.com/mifi/lossless-cut) | `TypeScript` | `43,614` | The swiss army knife of lossless video/audio editing |
| [remoteintech/remote-jobs](https://github.com/remoteintech/remote-jobs) | `JavaScript` | `40,802` | Source for remoteintech.company — a community-maintained directory of remote-friendly tech companies |
| [valinet/ExplorerPatcher](https://github.com/valinet/ExplorerPatcher) | `C` | `33,832` | This project aims to enhance the working environment on Windows |
| [microsoft/WSL](https://github.com/microsoft/WSL) | `C++` | `33,661` | Windows Subsystem for Linux |
| [cursor/cursor](https://github.com/cursor/cursor) | `—` | `33,225` | Sin descripción |
| [shadps4-emu/shadPS4](https://github.com/shadps4-emu/shadPS4) | `C++` | `32,774` | PlayStation 4 emulator for Windows, Linux, macOS and FreeBSD written in C++ |
| [HandBrake/HandBrake](https://github.com/HandBrake/HandBrake) | `C` | `24,339` | HandBrake's development repository  |
| [ntdevlabs/tiny11builder](https://github.com/ntdevlabs/tiny11builder) | `PowerShell` | `19,559` | Scripts to build a trimmed-down Windows 11 image. |
| [doitsujin/dxvk](https://github.com/doitsujin/dxvk) | `C++` | `18,041` | Vulkan-based implementation of D3D8, 9, 10 and 11 for Linux / Wine |
| [Billionmail/BillionMail](https://github.com/Billionmail/BillionMail) | `Go` | `15,567` | BillionMail gives you open-source MailServer, NewsLetter,  Email Marketing — fully self-hosted, dev-friendly, and free from mon... |
| [ajayyy/SponsorBlock](https://github.com/ajayyy/SponsorBlock) | `TypeScript` | `13,774` | Skip YouTube video sponsors (browser extension) |
| [Stremio/stremio-web](https://github.com/Stremio/stremio-web) | `JavaScript` | `13,710` | Stremio - Freedom to Stream |
| [ccfos/nightingale](https://github.com/ccfos/nightingale) | `Go` | `13,282` | Nightingale is to monitoring and alerting what Grafana is to visualization. |
| [material-components/material-web](https://github.com/material-components/material-web) | `SCSS` | `11,233` | Material Design Web Components |
| [sullo/nikto](https://github.com/sullo/nikto) | `Perl` | `10,719` | Nikto web server scanner |
| [antiwork/gumroad](https://github.com/antiwork/gumroad) | `Ruby` | `9,677` | See what sticks |
| [Open-Shell/Open-Shell-Menu](https://github.com/Open-Shell/Open-Shell-Menu) | `C++` | `9,305` | Classic Shell Reborn. |
| [LOLBAS-Project/LOLBAS](https://github.com/LOLBAS-Project/LOLBAS) | `XSLT` | `8,799` | Living Off The Land Binaries And Scripts - (LOLBins and LOLScripts) |
| [AnalogJ/scrutiny](https://github.com/AnalogJ/scrutiny) | `Go` | `8,196` | Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds |
| [builtbybel/FlyOOBE](https://github.com/builtbybel/FlyOOBE) | `C#` | `7,295` | Fly through your Windows 11 setup 🐝 |
| [bmrf/tron](https://github.com/bmrf/tron) | `Batchfile` | `6,562` | Tron |
| [karlstav/cava](https://github.com/karlstav/cava) | `C` | `6,406` | Cross-platform Audio Visualizer |
| [memstechtips/UnattendedWinstall](https://github.com/memstechtips/UnattendedWinstall) | `—` | `5,975` | Personalized Unattended Answer Files that helps automatically debloat and customize Windows 10 & 11 during the installation pro... |
| [trapexit/mergerfs](https://github.com/trapexit/mergerfs) | `C++` | `5,850` | a featureful union filesystem |
| [tonikelope/megabasterd](https://github.com/tonikelope/megabasterd) | `Java` | `5,742` | Yet another unofficial (and ugly) cross-platform MEGA downloader/uploader/streaming suite. |
| [tomnomnom/waybackurls](https://github.com/tomnomnom/waybackurls) | `Go` | `4,555` | Fetch all the URLs that the Wayback Machine knows about for a domain |
| [ufrisk/MemProcFS](https://github.com/ufrisk/MemProcFS) | `C` | `4,324` | MemProcFS |
| [nagadomi/nunif](https://github.com/nagadomi/nunif) | `Python` | `3,434` | Misc; latest version of waifu2x;  2D video to stereo 3D video conversion |
| [zai-org/GLM-4-Voice](https://github.com/zai-org/GLM-4-Voice) | `Python` | `3,229` | GLM-4-Voice \| 端到端中英语音对话模型 |
| [mon5termatt/medicat_installer](https://github.com/mon5termatt/medicat_installer) | `C++` | `3,225` | Medicat Installer Repo |
| [GuidoBartoli/sherloq](https://github.com/GuidoBartoli/sherloq) | `Perl` | `3,200` | An open-source digital image forensic toolset |
| [mayneyao/eidos](https://github.com/mayneyao/eidos) | `TypeScript` | `3,185` | A single-file relational spreadsheet for you and your agent. |
| [SilentNightSound/GI-Model-Importer](https://github.com/SilentNightSound/GI-Model-Importer) | `Python` | `3,128` | Tools and instructions for importing custom models into a certain anime game |
| [baskerville/sxhkd](https://github.com/baskerville/sxhkd) | `C` | `2,949` | Simple X hotkey daemon |
| [gracenolan/Notes](https://github.com/gracenolan/Notes) | `—` | `2,714` | Sin descripción |
| [tomnomnom/hacks](https://github.com/tomnomnom/hacks) | `Go` | `2,515` | A collection of hacks and one-off scripts |
| [jianfch/stable-ts](https://github.com/jianfch/stable-ts) | `Python` | `2,285` | Transcription, forced alignment, and audio indexing with OpenAI's Whisper |
| [an-anime-team/an-anime-game-launcher](https://github.com/an-anime-team/an-anime-game-launcher) | `Fluent` | `2,243` | An Anime Game launcher for Linux with telemetry disabling |
| [linagora/twake-drive-legacy](https://github.com/linagora/twake-drive-legacy) | `TypeScript` | `2,079` | LEGACY: The open-source alternative to Google Drive.  |
| [treadiehq/port-kill](https://github.com/treadiehq/port-kill) | `Rust` | `2,035` | Port Kill helps you find and free ports and caches blocking your dev work. |
| [bayasdev/envycontrol](https://github.com/bayasdev/envycontrol) | `Python` | `1,892` | Easy GPU switching for Nvidia Optimus laptops under Linux |
| [brektrou/rtl8821CU](https://github.com/brektrou/rtl8821CU) | `C` | `1,724` | Realtek RTL8811CU/RTL8821CU USB Wi-Fi adapter driver for Linux |
| [google/atheris](https://github.com/google/atheris) | `Python` | `1,676` | Sin descripción |
| [nahamsec/bbht](https://github.com/nahamsec/bbht) | `Shell` | `1,241` | A script to set up a quick Ubuntu 17.10 x64 box with tools I use.  |
| [gravesoft/msdl](https://github.com/gravesoft/msdl) | `JavaScript` | `1,201` | Microsoft Software Download Listing |
| [gotr00t0day/spyhunt](https://github.com/gotr00t0day/spyhunt) | `Python` | `896` | recon for bug hunters  |
| [LineageOS/lineage_wiki](https://github.com/LineageOS/lineage_wiki) | `SCSS` | `861` | Sin descripción |
| [NelloKudo/osu-winello](https://github.com/NelloKudo/osu-winello) | `Shell` | `815` | osu! stable installer for Linux with patched wine-osu and other nice features 8) |
| [hama3254/Crunchyroll-Downloader-v3.0](https://github.com/hama3254/Crunchyroll-Downloader-v3.0) | `Visual Basic .NET` | `804` | Downloader for Crunchyroll  |
| [SilentNightSound/SR-Model-Importer](https://github.com/SilentNightSound/SR-Model-Importer) | `Python` | `776` | Tools and instructions for importing custom models into a certain anime game number 2 |
| [travisbrown/memory.lol](https://github.com/travisbrown/memory.lol) | `Rust` | `734` | memory.lol |
| [SilentNightSound/GI-Model-Importer-Assets](https://github.com/SilentNightSound/GI-Model-Importer-Assets) | `—` | `719` | Asset files that can be used with the GI-Model-Importer for a certain anime game |
| [machine1337/fake-sms](https://github.com/machine1337/fake-sms) | `Python` | `566` | A small and efficent script to send SMS all over the world anonymously |
| [blindma1den/Programming-Skills-Level0](https://github.com/blindma1den/Programming-Skills-Level0) | `—` | `488` | This repository contains a series of entry-level exercises that can be solved in any programming language. The purpose of these... |
| [decoder-it/KrbRelayEx](https://github.com/decoder-it/KrbRelayEx) | `C#` | `389` | Sin descripción |
| [FDX100/GOD-KILLER](https://github.com/FDX100/GOD-KILLER) | `Python` | `375` | simple SMS-BOMBER and SMS Sender made with python work for Windows and Linux |
| [mate-desktop/caja](https://github.com/mate-desktop/caja) | `C` | `317` | Caja, the file manager for the MATE desktop |
| [coffinxp/wayback-url-finder](https://github.com/coffinxp/wayback-url-finder) | `HTML` | `260` | Sin descripción |
| [Cabdulahi/pish](https://github.com/Cabdulahi/pish) | `Python` | `260` | Sin descripción |
| [prasadgujar/CompetitiveProgramming](https://github.com/prasadgujar/CompetitiveProgramming) | `C++` | `254` | This repository contains Solutions & Setup for competitive programming competitions and Templates  for Data Structures and Algo... |
| [mwarning/chaos-sticker-collection](https://github.com/mwarning/chaos-sticker-collection) | `HTML` | `254` | A collection of chaos event / nerd culture related stickers. |
| [elastic/start-local](https://github.com/elastic/start-local) | `Shell` | `249` | Try Elasticsearch and Kibana locally |
| [mate-desktop/pluma](https://github.com/mate-desktop/pluma) | `C` | `190` | A powerful text editor for MATE |
| [RockyC36/StickerPack](https://github.com/RockyC36/StickerPack) | `—` | `180` | Linux distro and desktop stickers created in Inkscape |
| [BountyOS/bountyos.github.io](https://github.com/BountyOS/bountyos.github.io) | `HTML` | `166` | Sin descripción |
| [RealHackRH593/CC-MundoRH](https://github.com/RealHackRH593/CC-MundoRH) | `Shell` | `107` | saca credit card a full |
| [Alephgsm/Freya](https://github.com/Alephgsm/Freya) | `C#` | `96` | Freya , samsung Open Source flash tool with the best features |
| [coredamage/phonia](https://github.com/coredamage/phonia) | `Python` | `88` | Phonia Toolkit is one of the most advanced toolkits to scan  phone numbers using only free resources. The goal is to first  gat... |
| [Samuobe/Arch-Store](https://github.com/Samuobe/Arch-Store) | `Python` | `79` | Simple store for Arch Linux compatible with Flatpak, Pacman, and AUR (using Yay or Paru) |
| [asdcorp/rearm](https://github.com/asdcorp/rearm) | `Batchfile` | `64` | Rearm Every Activation-Related Mechanism |
| [momika233/loxs-optimized](https://github.com/momika233/loxs-optimized) | `Python` | `45` | Sin descripción |
| [dannyn/slimlock](https://github.com/dannyn/slimlock) | `C++` | `43` | SLiM + slock = slimlock |
| [an-anime-team/flatpak-builds](https://github.com/an-anime-team/flatpak-builds) | `Python` | `43` | Flatpak Files for Launcher |
| [joelburget/slimlock](https://github.com/joelburget/slimlock) | `C++` | `40` | SLiM + slock = slimlock |
| [freelancermijan/my-oneliners](https://github.com/freelancermijan/my-oneliners) | `Python` | `36` | Sin descripción |
| [h6nt3r/tools](https://github.com/h6nt3r/tools) | `Shell` | `35` | Sin descripción |
| [seiKiMo-Inc/HoYoStudio](https://github.com/seiKiMo-Inc/HoYoStudio) | `—` | `34` | Modded AssetStudio for HoYo Games. |
| [xnl-h4ck3r/getSubsidiaries](https://github.com/xnl-h4ck3r/getSubsidiaries) | `Python` | `32` | Get list of subsidiaries for a selected company |
| [DaniTheHack3r/personal-kali-customization](https://github.com/DaniTheHack3r/personal-kali-customization) | `Shell` | `28` | These are my customization scripts written in ansible for every time I have to perform a Kali clean install. |
| [lixdroid-404/WallFlex](https://github.com/lixdroid-404/WallFlex) | `—` | `22` | WallFlex is my personal wallpaper collection. |
| [CSWaifus/Waifus](https://github.com/CSWaifus/Waifus) | `—` | `21` | Sin descripción |
| [Hani-K/Bifr0st](https://github.com/Hani-K/Bifr0st) | `C` | `18` | Kernel for Alioth devices based on Xiaomi SM8250 with Nethunter support |
| [JesusChapman/monas_chinas_uwu_uwu](https://github.com/JesusChapman/monas_chinas_uwu_uwu) | `—` | `16` | Una colección de whallpapers de monas chinas para mis escritorios  |
| [ic4rta/NazunaRansom](https://github.com/ic4rta/NazunaRansom) | `C` | `12` | NazunaRansom, ransomware inspirado en mi waifu |
| [mdanilor/mdanilor.github.io](https://github.com/mdanilor/mdanilor.github.io) | `HTML` | `11` | A few posts and ideas ;) |
| [freelancermijan/bsqli](https://github.com/freelancermijan/bsqli) | `Python` | `9` | Sin descripción |
| [FerGem33/horariostec](https://github.com/FerGem33/horariostec) | `Python` | `8` | Inspired on haztuhorario.com |
| [bryanjorgeflores/hikari_anime](https://github.com/bryanjorgeflores/hikari_anime) | `—` | `8` | Lanzamientos públicos del aplicativo |
| [Yisusdev2005/Simple-OCR-for-Manga](https://github.com/Yisusdev2005/Simple-OCR-for-Manga) | `Python` | `7` | A simple OCR for manga (Japanese traditional and Japanese vertical) |
| [crhsdc/strands-agents-student-example](https://github.com/crhsdc/strands-agents-student-example) | `HTML` | `6` | # Asistente Académico — AWS Strands  Agente central con todas las capacidades académicas, expuesto como servicio HTTP con front... |
| [ramtoearth/ProblemsSolutionsAndNotes](https://github.com/ramtoearth/ProblemsSolutionsAndNotes) | `C++` | `5` | A set of competitive programming problems with their solutions. |
| [callmezatiel/NESTS-Installer](https://github.com/callmezatiel/NESTS-Installer) | `Python` | `5` | Freeze (package) Python programs into stand-alone executables |
| [alberto2236/satxml](https://github.com/alberto2236/satxml) | `Shell` | `4` | Descarga masiva SAT XML/CFDI por linea de comando |
| [Kurama2416/Linuxero](https://github.com/Kurama2416/Linuxero) | `HTML` | `4` | Linuxero es un repositorio con comandos esenciales y soluciones a errores en distintas distribuciones de Linux, como Ubuntu, Fe... |
| [ComputerNerd/cgdoom](https://github.com/ComputerNerd/cgdoom) | `C++` | `3` | This repository is a fork of CGDOOM which was ported originally by MPoupe. |
| [Amrloksha151/Spidey](https://github.com/Amrloksha151/Spidey) | `Python` | `3` | A web crawling utiltiy that supports threading, deep digging, and cookies. |
| [Samuel-Rodriguez28/AnalizadorAutomatas2](https://github.com/Samuel-Rodriguez28/AnalizadorAutomatas2) | `TypeScript` | `3` | Sin descripción |
| [Davidcrz14/DaizenClear](https://github.com/Davidcrz14/DaizenClear) | `C#` | `2` | Sistema de limpieza en múltiples fases que libera más memoria que las soluciones convencionales |
| [Davidcrz14/DavLoad](https://github.com/Davidcrz14/DavLoad) | `Python` | `2` | Programa en Python empaquetado para Uso en Windows con Installer, para descargar videos de YT en formato de Video o Audio (YT_DLP) |
| [Arturo254/OpenStore](https://github.com/Arturo254/OpenStore) | `PHP` | `2` | Prototipo basico de tienda de aplicaciones con buscador |
| [markskayff/install-firefox-py](https://github.com/markskayff/install-firefox-py) | `Python` | `2` | Install latest Firefox for Linux |
| [Samuel-Rodriguez28/ing-social.github.io](https://github.com/Samuel-Rodriguez28/ing-social.github.io) | `HTML` | `1` | Sin descripción |
| [lhdeavila/hcp](https://github.com/lhdeavila/hcp) | `Shell` | `1` | hardcore programming |
| [ramtoearth/email_newsletter](https://github.com/ramtoearth/email_newsletter) | `Rust` | `1` | Cloud native backend service |
