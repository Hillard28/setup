import { App, Astal, Gdk } from "astal/gtk4"
import style from "./style.scss"
import Bar from "./widget/Bar"
import type Gio from "gi://Gio?version=2.0";

const windows = new Map<Gdk.Monitor, Astal.Window[]>();

function makeWindowsForMonitor(monitor: Gdk.Monitor) {
    return [Bar(monitor)] as Astal.Window[];
}

App.start({
    css: style,
    icons: `${SRC}/icons`,
    main() {
        for (const monitor of App.get_monitors()) {
            windows.set(monitor, makeWindowsForMonitor(monitor));
        }

        const display = Gdk.Display.get_default()!;
        const monitors = display.get_monitors() as Gio.ListModel<Gdk.Monitor>;
        monitors.connect("items-changed", (monitorModel, position, idxRemoved, idxAdded) => {
            const prevSet = new Set(windows.keys());
            const currSet = new Set<Gdk.Monitor>();
            let i = 0;
            while (true) {
                const monitor = monitorModel.get_item(i) as Gdk.Monitor | null;
                i++;
                if (monitor) {
                    currSet.add(monitor);
                } else {
                    break;
                }
            }

            const removed = prevSet.difference(currSet);
            const added = currSet.difference(prevSet);

            // remove early, before anything else has a chance to break
            for (const monitor of removed) {
                const windowsToRemove = windows.get(monitor) ?? [];
                for (const window of windowsToRemove) {
                    window.destroy();
                }
            }

            display.sync();

            for (const monitor of added) {
                windows.set(monitor, makeWindowsForMonitor(monitor));
            }
        });
    },
});
