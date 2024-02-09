import { BaseConfig } from "https://deno.land/x/ddu_vim@v3.9.0/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v3.9.0/base/config.ts";

export class Config extends BaseConfig {
  override config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: "ff",
      uiParams: {
        ff: {
          filterFloatingPosition: "bottom",
          filterSplitDirection: "floating",
          floatingBorder: "rounded",
          previewFloating: true,
          previewFloatingBorder: "rounded",
          previewFloatingTitle: "Preview",
          previewSplit: "horizontal",
          prompt: "> ",
          split: "floating",
          startFilter: true,
        }
      },

      sourceOptions: {
        _: {
          matchers: [ "matcher_substring" ],
          ignoreCase: true,
        },
      },

      kindOptions: {
        _: {
          defaultAction: "open"
        },
      },
    });

    args.contextBuilder.patchLocal("file", {
      sources: [{
        name: "file",
        options: {
          converters: ["converter_devicon"]
        }
      }],
    });

    args.contextBuilder.patchLocal("file_recursive", {
      sources: [{
        name: "file_rec",
        options: {
          converters: ["converter_devicon"],
        },
        params: {
          ignoredDirectories: [ "node_modules", ".git", "dist"]
        },
      }],
    });

    args.contextBuilder.patchLocal("help", {
      sources: ["help"],
    });

    args.contextBuilder.patchLocal("ripgrep", {
      sources: ["rg"],
    });

    args.contextBuilder.patchLocal("buffer", {
      sources: ["buffer"],
    });

    return Promise.resolve();
  }
}
