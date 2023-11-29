nmcli con add \
  type wifi \
  con-name "eduroam" \
  ifname "wlp0s20f3" \
  ssid "eduroam" \
  wifi-sec.key-mgmt "wpa-eap" \
  802-1x.identity "g.stabachsalustiano@student.utwente.nl" \
  802-1x.password "g6rzO9f4MidHN2yLLTDW9MCRhoqJ6aer" \
  802-1x.system-ca-certs "yes" \
  802-1x.eap "peap" \
  802-1x.phase2-auth "mschapv2"

  nmcli connection up eduroam --ask
