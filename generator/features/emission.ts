import {CodeArtifact, FEATURE, FeatureModule} from '../types';
import {Hex} from 'viem';
import {EmissionManager} from './types';
import {addressPrompt, translateJsAddressToSol} from '../prompts/addressPrompt';
import {
  assetsSelectPrompt,
  translateAssetToAssetLibUnderlying,
} from '../prompts/assetsSelectPrompt';

export const emissionManager: FeatureModule<EmissionManager[]> = {
  value: FEATURE.EMISSION_MANAGER,
  description: 'SetEmissionAdmin',
  async cli({pool}) {
    const response: EmissionManager[] = [];
    const assets = await assetsSelectPrompt({
      message: 'Select the assets that will get a new admin',
      pool,
    });
    for (const asset of assets) {
      console.log(`collecting admin for ${asset}`);
      response.push({
        asset,
        admin: await addressPrompt({
          message: 'address of the admin',
          required: true,
        }),
      });
    }
    return response;
  },
  build({pool, cfg}) {
    const response: CodeArtifact = {
      code: {
        constants: cfg.map(
          (cfg) =>
            `address public constant ${cfg.asset}_EMISSION_ADMIN = ${translateJsAddressToSol(
              cfg.admin
            )};`
        ),
        execute: cfg.map(
          (cfg) =>
            `IEmissionManager(${pool}.EMISSION_MANAGER).setEmissionAdmin(
	      ${translateAssetToAssetLibUnderlying(cfg.asset, pool)},
	      ${cfg.asset}_EMISSION_ADMIN
	    );`
        ),
      },
      test: {
        fn: [
          `function test_isEmmissionAdmin() external {
            ${TEST_EXECUTE_PROPOSAL}
            assertEq(
              IEmissionManager(${pool}.EMISSION_MANAGER).getEmissionAdmin(
	        ${translateAssetToAssetLibUnderlying(cfg.asset, pool)}
              ),
	      ${translateJsAddressToSol(cfg.admin)}
            );
          }`,
        ],
      },
    };
    return response;
  },
};
