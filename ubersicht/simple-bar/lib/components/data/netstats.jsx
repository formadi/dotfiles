import * as Uebersicht from "uebersicht";
import * as DataWidget from "./data-widget.jsx";
import * as DataWidgetLoader from "./data-widget-loader.jsx";
import useWidgetRefresh from "../../hooks/use-widget-refresh.js";
import * as Icons from "../icons.jsx";
import * as Utils from "../../utils.js";
import * as Settings from "../../settings.js";

export { netstatsStyles as styles } from "../../styles/components/data/netstats";

const settings = Settings.get();
const { widgets, netstatsWidgetOptions } = settings;
const { netstatsWidget } = widgets;
const { refreshFrequency } = netstatsWidgetOptions;

const DEFAULT_REFRESH_FREQUENCY = 1000;
const REFRESH_FREQUENCY = Settings.getRefreshFrequency(
  refreshFrequency,
  DEFAULT_REFRESH_FREQUENCY
);

const formatBytes = (bytes, decimals = 1) => {
  if (!+bytes) return "--";

  const k = 1024;
  const dm = decimals < 0 ? 0 : decimals;
  const sizes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

  const i = Math.floor(Math.log(bytes) / Math.log(k));

  return `${parseFloat((bytes / Math.pow(k, i)).toFixed(dm))}<em>${
    sizes[i]
  }</em>`;
};

export const Widget = () => {
  const [state, setState] = Uebersicht.React.useState();
  const [loading, setLoading] = Uebersicht.React.useState(netstatsWidget);

  const getNetstats = async () => {
    try {
      const output = await Uebersicht.run(
        `bash ./simple-bar/lib/scripts/netstats.sh 2>&1`
      );
      const data = Utils.cleanupOutput(output);
      const json = JSON.parse(data);
      setState(json);
      setLoading(false);
    } catch (e) {
      setTimeout(getNetstats, 1000);
    }
  };

  useWidgetRefresh(netstatsWidget, getNetstats, REFRESH_FREQUENCY);

  if (loading) return <DataWidgetLoader.Widget className="netstats" />;
  if (!state) return null;
  const { download, upload } = state;

  if (download === undefined || upload === undefined) return null;

  return (
    <Uebersicht.React.Fragment>
      <DataWidget.Widget
        classes="netstats"
        tooltip="Network stats"
        disableSlider
      >
        <div className="netstats__item netstats__item--download">
          <Icons.Download className="netstats__icon" />
          <span
            className="netstats__value"
            dangerouslySetInnerHTML={{ __html: formatBytes(download) }}
          />
        </div>
      </DataWidget.Widget>
      <DataWidget.Widget
        classes="netstats"
        tooltip="Network stats"
        disableSlider
      >
        <div className="netstats__item netstats__item--upload">
          <Icons.Upload className="netstats__icon" />
          <span
            className="netstats__value"
            dangerouslySetInnerHTML={{ __html: formatBytes(upload) }}
          />
        </div>
      </DataWidget.Widget>
    </Uebersicht.React.Fragment>
  );
};
