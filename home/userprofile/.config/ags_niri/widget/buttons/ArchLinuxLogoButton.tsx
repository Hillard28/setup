import GLib from "gi://GLib?version=2.0";
import { Icons } from "../utils/Icons";

export const ArchLinuxLogoButton = () => {
  let iconName = GLib.get_os_info("LOGO");
  let icon: String = "";
  if (!iconName) {
    icon = Icons.linux;
  }

  if (GLib.get_os_info("ID") == "arch") {
    icon = Icons.arch;
  }

  function openfuzzel() {
    try {
      const [pkillSuccess, pkillStdout, pkillStderr, pkillStatus] =
        GLib.spawn_command_line_sync("pkill fuzzel");
      if (!pkillSuccess) {
        throw new Error(
          `pkill command failed with status ${pkillStatus}: ${pkillStderr}`,
        );
      }

      const [fuzzelSuccess, fuzzelStdout, fuzzelStderr, fuzzelStatus] =
        GLib.spawn_command_line_sync(
          "fuzzel",
        );
      if (!fuzzelSuccess) {
        throw new Error(
          `fuzzel command failed with status ${fuzzelStatus}: ${fuzzelStderr}`,
        );
      }
    } catch (error) {
      console.error("Failed to execute command:", error);
    }
  }
  return (
    <button
      onClicked={openfuzzel}
      cssClasses={["workspace-buttons", "arch-button"]}
    >
      {icon ? icon : <image iconName={iconName!} />}
    </button>
  );
};
