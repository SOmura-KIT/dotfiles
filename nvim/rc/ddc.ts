import { BaseConfig } from 'https://deno.land/x/ddc_vim@v4.0.5/types.ts';
import { ConfigArguments } from 'https://deno.land/x/ddc_vim@v4.0.5/base/config.ts';

export class Config extends BaseConfig {
  override async config(args: ConfigArguments): Promise<void> {
    args.contextBuilder.patchGlobal({
      ui: 'pum',
      autoCompleteEvents: [
        'InsertEnter',
        'TextChangedI',
        'TextChangedP',
        'TextChangedT',
        'CmdlineEnter',
        'CmdlineChanged',
      ],
      sources: ['skkeleton', 'around', 'lsp'],
      cmdlineSources: {
        ':': ['cmdline', 'cmdline-history', 'around'],
        '@': ['cmdline-history', 'around'],
        '>': ['cmdline-history', 'around'],
        '/': ['around'],
        '?': ['around'],
        '-': ['around'],
        '=': [],
      },
      sourceOptions: {
        _: {
          maxItems: 10,
          matchers: ['matcher_fuzzy'],
          sorters: ['sorter_fuzzy'],
          converters: ['converter_fuzzy'],
        },
        skkeleton: {
          mark: '[SKK]',
          matchers: ['skkeleton'],
          sorters: [],
          minAutoCompleteLength: 1,
          isVolatile: true,
        },
        around: {
          mark: '[ARW]',
        },
        lsp: {
          mark: '[LSP]',
          forceCompletionPattern: "\\.\\w*|::\\w*|->\\w*",
          dup: 'force',
        },
        cmdline: {
          mark: '[CMD]',
        },
        "cmdline-history": {
          mark: '[HST]',
          sorters: [],
        },
      },
      filterParams: {
        matcher_fuzzy: {
          splitMode: 'word',
        },
      },
    });
  }
}
