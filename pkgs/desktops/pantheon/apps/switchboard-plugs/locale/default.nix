{ lib, stdenv
, fetchFromGitHub
, nix-update-script
, fetchpatch
, pantheon
, meson
, ninja
, pkg-config
, vala
, libgee
, granite
, gtk3
, switchboard
, cmake
, polkit
, accountsservice
, gnome-settings-daemon
, elementary-settings-daemon
, gnome
, ibus
, switchboard-with-plugs
}:

stdenv.mkDerivation rec {

  pname = "switchboard-plug-locale";
  version = "2.5.4";

  src = fetchFromGitHub {
    owner = "elementary";
    repo = pname;
    rev = version;
    sha256 = "0gk16px3px2li7pgry9q9i95lacia9i4k3ysdikzj9rgims4jp2x";
  };


  passthru = {
    updateScript = nix-update-script {
      attrPath = "pantheon.${pname}";
    };
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    vala
    cmake
  ];

  buildInputs = [
    granite
    gtk3
    libgee
    switchboard
    polkit
    accountsservice
    gnome.gnome-desktop
    ibus
  ];

  meta = with lib; {
    description = "Switchboard Locale Plug";
    homepage = "https://github.com/elementary/switchboard-plug-locale";
    license = licenses.lgpl3Plus;
    platforms = platforms.linux;
    maintainers = teams.pantheon.members;
  };
}
