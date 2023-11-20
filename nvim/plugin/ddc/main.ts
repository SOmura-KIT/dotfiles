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
      sources: ['nvim-lsp', 'around', 'skkeleton'],
      cmdlineSources: {
        ':': [],
        '@': [],
        '>': [],
        '/': [],
        '?': [],
        '-': [],
        '=': [],
      },
      specialBufferCompletion: true,
      sourceOptions: {
        _: {
          maxItems: 10,
          minAutoCompleteLength: 1,
          matchers: ['matcher_fuzzy'],
          sorters: ['sorter_fuzzy'],
          converters: ['converter_fuzzy'],
          ignoreCase: true,
        },
        'nvim-lsp': {
          mark: '[LSP]',
          dup: 'keep',
          keywordPattern: '\k+',
          sorters: ['sorter_lsp-kind'],
        },
        skkeleton: {
          mark: '[SKK]',
          matchers: ['skkeleton'],
          sorters: [],
          isVolatile: true,
        },
        around: {
          'mark': '[A]'
        },
      },
      sourceParams: {
        'nvim-lsp': {
          snippetEngine: await args.denops.eval(
            "denops#callback#register({ body -> vsnip#anonymous(body) })",
          ),
          enableResolveItem: true,
          enableAdditionalTextEdit: true,
          confirmBehavior: 'replace',
        }
      },
    });
  }
}
