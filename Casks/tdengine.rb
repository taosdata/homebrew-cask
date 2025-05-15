cask "tdengine" do
  version "3.3.6.6"
  sha256 intel: "a4cf69c06969c5a008ee8f17e91140184e4fd4bf10c9c8ec32807510f8b6a068",  # Intel
         arm:   "f9d8bc937bec2c9e076d82384f21ee0ac97ace90327fc13c3e622dab496678d1"  # ARM

  url "https://www.taosdata.com/assets-download/3.0/TDengine-server-#{version}-macOS-#{Hardware::CPU.intel? ? "x64" : "arm64"}.pkg"
  name "TDengine"
  desc "Time-Series Database"
  homepage "https://www.taosdata.com/"

  pkg "TDengine-server-#{version}-macOS-#{Hardware::CPU.intel? ? "x64" : "arm64"}.pkg"

  livecheck do
    url "https://github.com/taosdata/TDengine/releases/latest"
    strategy :header_match
    regex(/(\d+\.\d+\.\d+\.\d+)/)
  end

  uninstall pkgutil: "com.taosdata.tdengine",
  script:  {
    executable: "/usr/local/bin/rmtaos",
    args:       ["-e", "no"],  # 强制删除
    sudo:       true,            # 需要sudo权限
  }

  postflight do
    puts <<~EOS

      TDengine is installed successfully. Please open an terminal window and execute the commands below:

      To configure TDengine: sudo vi /etc/taos/taos.cfg
      To configure taosadapter: sudo vi /etc/taos/taoadapter.toml
      To configure taos-explorer: sudo vi /etc/taos/explorer.toml

      To start TDengine service: sudo launchctl start com.tdengine.taosd
      To start taosAdapter service: sudo launchctl start com.tdengine.taosadapter
      To start taosExplorer service: sudo launchctl start com.tdengine.taos-explorer
      To start all services: sudo start-all.sh

      To access TDengine Commnd Line Interface: taos -h <ip>
      To access TDengine Web Admin Console: http://<ip>:6060
    EOS
  end
end