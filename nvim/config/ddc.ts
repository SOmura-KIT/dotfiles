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
      sources: ['skkeleton'],
      sourceOptions: {
        _: {
          maxItems: 10,
        },
        skkeleton: {
          mark: '[SKK]',
          matchers: ['skkeleton'],
          sorters: [],
          minAutoCompleteLength: 1,
          isVolatile: true,
        },
      },
    });
  }
}
