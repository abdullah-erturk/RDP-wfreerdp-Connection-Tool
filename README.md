<div align="center">

<a href="https://buymeacoffee.com/abdullaherturk" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

# 🖥️ RDP (wfreerdp) Connection Tool 

![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge)
![Tech](https://img.shields.io/badge/Tech-Batch_&_PowerShell-blue?style=for-the-badge)

[![made-for-windows](https://img.shields.io/badge/Made%20for-Windows-00A4E3.svg?style=flat&logo=microsoft)](https://www.microsoft.com/)
[![Open Source?](https://img.shields.io/badge/Open%20source%3F-Of%20course%21%20%E2%9D%A4-009e0a.svg?style=flat)](https://github.com/abdullah-erturk/RDP-wfreerdp-Connection-Tool)

![sample](https://github.com/abdullah-erturk/RDP-wfreerdp-Connection-Tool/blob/main/preview.jpg)

</div>

## Link:
[![Stable?](https://img.shields.io/badge/Release-v1.svg?style=flat)](https://github.com/abdullah-erturk/RDP-wfreerdp-Connection-Tool/archive/refs/heads/main.zip)

### Genel Bakış
[`wfreerdp.exe`](https://ci.freerdp.com/job/freerdp-nightly-windows/), açık kaynaklı [`Freerdp.exe`](https://github.com/FreeRDP/FreeRDP) projesine ait bir programdır. Windows’ta Remote Desktop (Uzak Masaüstü) bağlantıları kurmak için kullanılan bir komut satırı istemcisidir. Bu proje wfreerdp.exe dosyasının kullanımını kolaylaştırmak için hazırlanmıştır.

### Overview
[`wfreerdp.exe`](https://ci.freerdp.com/job/freerdp-nightly-windows/) is a program belonging to the open-source [`Freerdp.exe`](https://github.com/FreeRDP/FreeRDP) project. It is a command-line client used to establish Remote Desktop connections in Windows. This project was created to simplify the use of the wfreerdp.exe file.

---

<details>
<summary><strong>Türkçe Tanıtım</strong></summary>
  
# 🖥️ RDP (wfreerdp) Connection Tool

Komut satırından hızlı ve güvenli RDP bağlantısı kurmak için geliştirilmiş, taşınabilir bir Windows batch aracı.

---

## ✨ Özellikler

- 💾 **Bağlantı kaydetme** — IP, kullanıcı adı ve şifreyi şifreleyerek saklar
- ✏️ **Bağlantı düzenleme** — Kayıtlı bağlantılarda alan alan güncelleme
- 🗑️ **Bağlantı silme** — Tek tuşla kayıtlı bağlantı silme
- 🔐 **XOR şifreleme** — Kullanıcı adı ve şifre INI dosyasında şifreli tutulur
- 🌍 **Unicode desteği** — Türkçe, Arapça, Çince vb. dahil tüm karakter setleri desteklenir
- 📁 **Taşınabilir** — Kurulum gerektirmez, `.exe` gerektirmez (sadece `wfreerdp.exe`)
- ⚡ **WinPE uyumlu** — SYSTEM hesabında, kurulum ortamlarında çalışır

---

## 📋 Gereksinimler

- Windows 7 ve üzeri (veya WinPE)
- [`wfreerdp.exe`](https://ci.freerdp.com/job/freerdp-nightly-windows/) — betikle aynı klasörde olmalı

---

## 🚀 Kullanım

`wfreerdp.exe` dosyasını indirip `rdp.cmd` ile aynı klasöre koy, ardından çalıştır:
(wfreerdp.exe paket içinde mevcuttur. Mevcut sürüm: 3.23.1)

```
rdp.cmd
```

### Ana Menü

```
===========================================================
              REMOTE DESKTOP CONNECTION TOOL
===========================================================

Saved Connections:
-----------------------------------------------------------
[1] Üretim Sunucusu (192.168.1.10)
[2] Test Ortamı (10.0.0.5)

[0] New Connection
[E] Edit a connection
[D] Delete a connection
```

### Bağlantı Kaydetme

Yeni bağlantı eklerken:
- **IP adresi** — `192.168.1.10` veya `192.168.1.10:3389` formatında
- **Connection Name** — isteğe bağlı (boş bırakılırsa IP kullanılır)
- **Username** — şifreli saklanır
- **Password** — şifreli saklanır, ekranda görünmez

### Bağlantı Düzenleme `[E]`

Bağlantı seçildikten sonra 4 alan ayrı ayrı düzenlenebilir:

```
[1] Connection Name  (current: Üretim Sunucusu)
[2] IP Address       (current: 192.168.1.10)
[3] Username         (encrypted)
[4] Password         (encrypted)
[S] Save and return
```

---

## 🔒 Güvenlik

Kullanıcı adı ve şifre, `rdp_connections.ini` dosyasında **XOR + hex** yöntemiyle şifrelenir. Bu yöntem tersine mühendisliğe karşı mutlak koruma sağlamaz; amaç düz metin olarak dosyada görünmesini engellemektir.

INI dosyası örneği:
```
DNS=192.168.1.10=1A2B3C4D=5E6F7A8B...
```

---

## 📁 Dosya Yapısı

```
📂 wfreerdp/
├── rdp.cmd                 ← Ana betik
├── wfreerdp.exe            ← FreeRDP (paket içinde mevcut, yeni sürümler için ayrıca indirilmeli)
└── rdp_connections.ini     ← Kayıtlı bağlantılar (kullanıcı tercihine göre otomatik oluşur)
```

---

## ⚙️ wfreerdp Parametrelerini Özelleştirme

Betikte üç bağlantı satırı bulunur. Kendi ihtiyacına göre bu satırlara parametre ekleyebilirsin:

| Satır | Açıklama |
|---|---|
| **98** | Kayıtlı bağlantıyla bağlanma |
| **254** | Yeni bağlantıyı kaydederken bağlanma |
| **261** | Kaydedilmeden doğrudan bağlanma |

Örneğin tam ekran, çözünürlük veya çoklu monitör için:

```batch
:: Tam ekran
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /f /cert:ignore

:: Belirli çözünürlük
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /w:1920 /h:1080 /cert:ignore

:: Çoklu monitör
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /multimon /cert:ignore

```

Tüm parametreler için: `wfreerdp.exe /?`

---

## 🆚 `wfreerdp` ve `mstsc` Arasındaki Fark

| Özellik | mstsc | wfreerdp |
|---|---|---|
| Windows kurulu gelir | ✅ | ❌ |
| Komut satırı parametreleri | Sınırlı | Kapsamlı |
| WinPE / SYSTEM hesabı | ❌ | ✅ |
| Taşınabilir (tek .exe) | ❌ | ✅ |
| Açık kaynak | ❌ | ✅ |

`mstsc`, Windows oturumu ve LSASS gibi sistem servislerine bağımlıdır. `wfreerdp` ise RDP protokolünü bağımsız olarak implemente ettiğinden WinPE, SYSTEM hesabı ve kurulum ortamlarında sorunsuz çalışır.

---

</details>

<details>
<summary><strong>English Description</strong></summary>

# 🖥️ RDP (wfreerdp) Connection Tool

A portable Windows batch tool for fast and secure RDP connections from the command line.

---

## ✨ Features

- 💾 **Save connections** — stores IP, username, and password with encryption
- ✏️ **Edit connections** — update individual fields on saved connections
- 🗑️ **Delete connections** — remove any saved connection with a single keystroke
- 🔐 **XOR encryption** — username and password are stored encrypted in the INI file
- 🌍 **Unicode support** — supports all character sets including Turkish, Arabic, Chinese, etc.
- 📁 **Portable** — no installation required, no dependencies (only `wfreerdp.exe`)
- ⚡ **WinPE compatible** — runs under the SYSTEM account and in deployment environments

---

## 📋 Requirements

- Windows 7 or later (or WinPE)
- [`wfreerdp.exe`](https://ci.freerdp.com/job/freerdp-nightly-windows/) — must be placed in the same folder as the script

---

## 🚀 Usage

Download `wfreerdp.exe` and place it in the same folder as `rdp.cmd`, then run:
(wfreerdp.exe is included in the package. Current version: 3.23.1)

```
rdp.cmd
```

### Main Menu

```
===========================================================
              REMOTE DESKTOP CONNECTION TOOL
===========================================================

Saved Connections:
-----------------------------------------------------------
[1] Production Server (192.168.1.10)
[2] Test Environment (10.0.0.5)

[0] New Connection
[E] Edit a connection
[D] Delete a connection
```

### Saving a Connection

When adding a new connection:
- **IP address** — in `192.168.1.10` or `192.168.1.10:3389` format
- **Connection Name** — optional (IP is used if left blank)
- **Username** — stored encrypted
- **Password** — stored encrypted, never shown on screen

### Editing a Connection `[E]`

After selecting a connection, each field can be edited individually:

```
[1] Connection Name  (current: Production Server)
[2] IP Address       (current: 192.168.1.10)
[3] Username         (encrypted)
[4] Password         (encrypted)
[S] Save and return
```

---

## 🔒 Security

The username and password are encrypted using **XOR + hex encoding** before being written to `rdp_connections.ini`. This does not provide absolute protection against reverse engineering; the purpose is to prevent credentials from appearing as plain text in the file.

Sample INI file:
```
DNS=192.168.1.10=1A2B3C4D=5E6F7A8B...
```

---

## 📁 File Structure

```
📂 wfreerdp/
├── rdp.cmd                 ← Main script
├── wfreerdp.exe            ← FreeRDP binary (Included in the package; new versions must be downloaded separately.)
└── rdp_connections.ini     ← Saved connections (It is generated automatically according to user preference.)
```

---

## ⚙️ Customizing wfreerdp Parameters

The script contains three connection lines. You can add your own parameters to any of them:

| Line | Description |
|---|---|
| **98** | Connecting with a saved connection |
| **254** | Connecting while saving a new connection |
| **261** | Connecting directly without saving |

For example, to enable fullscreen, set resolution, or use multiple monitors:

```batch
:: Fullscreen
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /f /cert:ignore

:: Custom resolution
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /w:1920 /h:1080 /cert:ignore

:: Multiple monitors
start "" wfreerdp.exe /v:!ip! /u:!target_user! /p:"!target_pass!" /multimon /cert:ignore

```

For all available parameters run: `wfreerdp.exe /?`

---

## 🆚 The Difference Between `wfreerdp` and `mstsc`

| Feature | mstsc | wfreerdp |
|---|---|---|
| Built into Windows | ✅ | ❌ |
| Command-line parameters | Limited | Extensive |
| WinPE / SYSTEM account | ❌ | ✅ |
| Portable (single .exe) | ❌ | ✅ |
| Open source | ❌ | ✅ |

`mstsc` depends on Windows session infrastructure and system services like LSASS. `wfreerdp` implements the RDP protocol independently, making it work seamlessly in WinPE, under the SYSTEM account, and in deployment environments where no user session exists.

---

</details>

<div align="center">

Made with ❤️ by [Abdullah ERTÜRK](https://github.com/abdullah-erturk)

[🌐 erturk.netlify.app](https://erturk.netlify.app)

</div>

