// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console2.sol";
import "forge-std/Test.sol";
import "../../src/day_01/Day0102.sol";

contract Day01Test is Test {
    Day0102 public day01;

    function setUp() public {
        day01 = new Day0102();
    }

    function test_Day0102_Example1() public {
        string memory input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000";
        emit log_string(input);
        uint256 answer = day01.answer(input);
        emit log_uint(answer);
        assertEq(answer, 45000);
    }

    function test_Day0102_MainChallenge() public {
        string memory input =
            "7844\n1892\n10928\n4800\n9730\n3485\n7293\n\n11956\n2767\n12893\n2757\n3026\n9979\n\n4507\n4199\n2855\n1792\n2041\n4162\n3855\n2650\n2165\n5464\n2125\n4979\n4878\n6301\n\n2546\n3750\n1192\n4692\n6809\n2808\n6505\n2811\n6448\n4270\n2919\n1297\n1678\n\n2006\n6163\n5949\n2074\n5917\n5796\n3456\n1161\n6843\n3988\n4064\n5591\n\n17062\n14531\n5297\n\n16033\n18054\n25935\n\n3621\n3121\n5884\n5199\n4584\n4796\n1325\n3374\n5789\n2545\n5842\n1760\n5766\n1882\n3084\n\n10364\n1136\n2256\n5654\n7065\n5990\n3621\n8063\n\n4334\n1865\n4485\n4741\n2591\n2594\n2991\n3928\n5849\n6864\n4932\n\n6627\n8318\n11410\n18778\n\n14870\n13264\n8777\n2567\n15388\n\n11837\n11042\n12115\n11169\n8021\n4206\n8637\n\n2955\n2115\n2292\n2759\n6464\n2843\n3817\n1628\n6486\n2499\n3935\n4944\n1427\n4870\n\n14800\n13942\n2563\n18543\n\n8415\n5943\n6117\n3863\n7123\n8666\n9834\n7437\n\n12318\n5577\n8108\n11695\n2720\n3413\n\n4765\n2805\n2850\n5241\n3910\n4837\n5770\n4998\n3358\n5141\n1052\n2281\n4405\n1714\n\n7984\n4685\n12922\n11579\n4278\n\n14877\n4676\n4571\n9279\n11337\n\n1782\n3009\n14712\n\n5936\n5243\n3849\n1001\n10728\n3847\n9986\n\n1531\n3707\n3599\n5533\n4025\n4651\n3934\n4205\n2481\n3462\n1672\n1806\n3833\n4072\n1497\n\n16920\n25420\n17042\n\n43927\n\n8193\n3107\n2831\n4122\n16336\n\n7507\n1665\n8553\n3231\n2528\n1046\n3491\n4631\n3574\n\n35988\n29345\n\n3520\n4006\n6327\n1658\n4714\n1123\n1938\n3667\n3807\n1824\n4808\n4586\n3275\n4548\n\n9989\n32096\n\n52470\n\n1188\n7694\n7875\n6114\n6189\n4343\n6974\n4812\n1776\n4794\n8065\n\n2364\n4111\n3663\n4182\n3667\n5440\n5482\n2657\n3931\n5871\n5403\n5956\n2659\n2320\n\n10249\n13770\n\n6331\n7262\n1498\n1329\n8943\n1563\n8197\n6898\n2300\n\n5116\n5930\n8363\n8908\n6063\n8325\n1070\n\n7829\n8877\n5631\n6100\n1007\n4754\n7353\n8363\n\n13160\n16304\n6155\n15418\n\n18068\n24378\n16529\n\n8216\n1918\n3305\n7698\n5936\n2012\n2053\n3575\n5705\n\n5372\n3627\n2860\n3742\n4117\n5514\n2590\n4503\n2494\n4418\n1908\n4109\n5255\n5749\n5061\n\n14547\n31905\n\n4691\n4268\n3887\n4136\n5724\n4507\n2298\n6660\n5243\n4719\n5145\n2949\n1460\n\n6324\n1211\n2329\n4872\n5530\n1645\n2989\n3687\n3925\n2578\n1153\n4364\n\n1864\n8160\n9219\n6479\n1098\n9364\n7442\n9665\n1522\n\n3185\n3657\n5730\n7979\n8956\n2138\n8288\n3524\n7910\n\n20487\n\n4948\n4419\n3363\n6742\n1536\n3809\n4289\n1861\n2490\n4842\n1005\n2083\n3115\n\n5872\n2895\n2163\n6140\n4962\n1566\n1502\n6407\n6241\n7154\n\n8910\n5483\n10358\n10448\n5912\n9133\n1919\n5768\n\n7887\n1592\n3503\n6182\n10088\n12143\n\n3897\n4813\n2087\n2953\n5308\n1587\n7320\n4947\n1366\n6723\n2720\n\n16484\n15947\n2582\n11421\n\n2457\n1498\n4113\n5639\n3930\n4950\n4130\n5475\n6156\n4966\n1322\n5749\n5892\n2257\n\n24070\n\n2634\n2784\n5289\n1472\n5770\n4442\n1733\n2003\n2281\n4283\n4183\n3183\n5405\n5055\n4089\n\n6167\n5650\n6531\n8255\n11103\n12421\n\n8499\n15327\n4714\n\n52582\n\n8000\n4408\n4744\n7665\n3565\n6676\n4983\n3282\n1095\n8269\n\n6893\n4008\n2512\n5249\n6578\n2231\n7044\n7903\n3901\n2480\n1832\n\n2278\n5805\n7783\n1497\n4503\n5569\n4260\n7618\n3310\n8083\n\n8025\n17429\n14782\n12645\n\n5914\n1865\n9622\n4014\n9577\n1812\n8287\n10720\n\n3848\n12978\n12735\n3860\n\n5562\n11339\n9051\n6703\n13290\n10611\n\n1232\n1116\n2620\n2495\n4198\n4751\n6099\n3727\n3111\n2493\n3780\n2379\n3042\n4395\n6100\n\n62606\n\n13357\n13984\n11428\n18201\n\n33875\n5610\n\n2504\n19711\n17021\n5985\n\n3759\n5522\n8815\n2113\n2333\n9169\n4805\n2870\n6419\n\n6210\n4186\n3763\n5633\n5159\n5116\n4448\n4570\n5894\n4045\n1994\n3044\n\n10366\n6706\n11448\n1927\n10647\n11786\n11927\n\n1350\n10908\n9325\n2455\n\n10527\n8300\n1312\n1403\n8155\n8803\n9663\n7780\n\n2118\n5436\n5909\n4083\n3714\n3001\n2226\n2915\n5627\n6476\n3578\n6112\n\n36649\n6648\n\n17271\n23884\n15032\n\n16967\n17931\n2443\n\n2520\n1468\n2779\n6020\n4477\n4798\n1894\n2429\n4645\n5053\n6478\n5899\n5824\n2554\n\n12614\n11252\n25055\n\n3435\n1317\n5073\n3082\n4576\n5006\n2238\n3055\n4867\n5079\n4385\n5723\n2084\n4307\n\n6609\n1556\n2351\n2301\n4913\n1820\n1122\n5398\n4738\n2377\n2843\n4704\n\n1201\n1092\n1622\n6094\n1793\n6521\n8237\n2848\n5617\n6585\n\n3561\n8072\n3941\n4432\n4740\n9292\n8115\n3586\n5464\n\n2926\n6812\n5551\n3104\n4369\n7421\n3774\n1272\n1492\n1842\n6058\n1815\n\n5555\n2688\n8859\n8517\n3338\n1500\n7276\n8130\n5984\n\n6597\n5544\n4944\n6402\n1336\n4243\n4333\n6374\n6770\n5346\n\n7225\n33323\n\n17863\n9174\n21966\n\n4835\n4359\n6074\n4069\n5984\n11934\n2577\n\n1738\n2317\n6844\n1672\n4213\n3930\n4658\n5785\n8074\n5695\n\n3063\n6287\n7248\n5656\n1571\n5468\n1512\n5555\n3192\n7892\n5664\n\n5819\n28895\n\n4407\n5072\n4733\n2964\n4073\n5739\n2423\n6131\n3999\n1454\n1221\n1243\n\n26391\n\n35896\n26888\n\n1171\n4136\n1050\n5788\n1049\n5686\n5297\n6035\n2968\n2274\n2771\n5596\n4478\n3401\n5860\n\n6699\n15009\n4368\n13135\n13609\n\n6033\n3972\n1214\n1549\n3996\n2251\n3213\n5217\n5525\n3656\n2585\n2710\n6035\n1903\n1586\n\n8651\n\n4494\n7096\n7913\n1024\n1334\n1353\n2705\n5405\n1601\n7386\n\n18756\n19801\n24646\n\n8490\n5254\n1932\n3706\n1980\n6058\n1961\n3150\n5200\n1337\n\n2846\n6123\n3274\n4632\n3068\n5384\n5842\n2688\n1307\n3279\n2424\n4783\n3932\n\n2720\n7808\n5871\n1416\n7979\n6594\n7325\n4214\n5444\n2132\n\n2626\n6949\n6034\n4887\n6773\n1111\n3317\n3388\n4209\n2809\n2730\n6578\n2700\n\n8995\n10064\n\n2134\n5564\n5889\n3719\n6357\n3523\n4600\n2138\n5976\n6025\n5689\n5950\n3745\n1542\n\n5545\n5789\n4295\n6717\n8612\n3847\n7911\n3367\n6867\n5975\n\n23119\n18834\n3134\n\n7080\n2729\n4118\n1407\n7022\n4796\n8459\n8530\n7721\n7333\n\n5245\n3739\n1338\n1245\n2926\n2695\n4571\n1492\n4794\n4380\n3726\n2225\n2098\n5942\n6081\n\n2192\n2866\n4690\n4240\n6512\n1881\n5789\n1641\n6017\n4327\n3688\n6622\n3555\n\n12879\n2468\n13146\n8534\n10525\n4590\n\n8451\n8697\n11858\n5657\n4893\n\n14019\n13301\n7206\n13988\n\n17234\n22191\n13894\n\n6383\n3682\n5281\n6335\n5412\n5474\n8723\n9536\n8864\n\n14888\n9953\n\n2464\n5875\n2484\n1693\n3441\n5883\n7835\n\n34085\n\n1997\n9058\n7144\n6222\n2930\n3661\n4107\n8058\n4938\n\n3033\n2420\n5196\n5152\n1364\n2192\n3442\n1149\n3575\n6916\n6856\n1995\n6259\n\n1331\n1731\n10757\n3486\n8823\n2450\n8018\n9197\n\n64329\n\n25450\n\n6652\n4972\n5085\n1881\n5555\n1521\n3723\n1158\n3260\n1532\n3131\n2904\n\n1088\n14166\n4490\n15880\n6439\n\n19789\n5274\n7770\n11329\n\n64877\n\n4256\n5811\n3538\n8943\n\n6164\n7843\n5400\n14856\n2882\n\n2781\n3829\n8689\n6347\n8239\n4232\n8606\n5770\n\n10061\n6576\n19346\n15720\n\n9071\n6842\n5147\n8570\n4175\n3801\n6512\n\n21045\n29371\n\n5646\n1786\n11347\n11957\n4226\n12836\n\n1786\n1117\n2905\n5545\n2759\n3168\n5993\n1050\n4096\n1812\n1036\n3048\n1602\n\n5694\n4123\n4940\n8115\n8877\n2063\n7222\n\n5281\n5676\n5429\n5198\n1480\n7224\n6453\n2535\n1894\n2730\n5489\n6674\n\n6091\n3148\n4124\n5837\n1575\n4028\n5943\n2374\n3307\n4535\n2008\n2981\n1251\n1902\n1689\n\n1154\n4931\n1030\n6793\n9190\n6920\n6588\n4759\n5502\n\n23727\n\n1716\n2529\n6082\n5333\n2555\n3710\n4174\n1747\n1506\n2434\n2343\n4019\n5704\n1253\n3978\n\n13129\n11913\n9504\n11759\n5353\n9152\n\n7685\n7469\n2376\n2221\n3446\n2576\n7992\n2538\n3572\n1715\n7268\n\n15241\n4735\n10421\n9976\n1717\n\n3460\n5386\n1806\n3764\n3019\n4349\n6319\n6635\n6608\n7641\n\n3249\n2254\n4624\n2495\n3325\n1502\n2347\n1544\n2806\n2844\n5702\n3594\n3448\n4378\n5474\n\n4447\n1251\n1088\n2070\n4109\n1029\n5779\n3795\n1080\n3589\n3016\n2793\n2636\n5946\n4953\n\n52518\n\n5836\n6177\n4873\n2860\n4545\n2793\n3492\n6810\n2330\n2067\n3626\n\n14370\n14242\n8644\n16054\n7313\n\n8547\n6827\n1264\n8991\n1306\n3829\n6188\n\n1566\n6239\n4931\n5359\n7314\n7493\n2898\n4429\n5609\n3329\n\n6747\n3945\n9283\n10312\n2925\n11240\n\n9133\n14062\n15257\n12353\n\n12534\n17806\n5580\n7262\n\n4311\n3933\n3798\n4932\n3040\n1819\n4434\n5705\n1293\n4348\n4241\n3050\n4471\n4445\n\n21451\n9368\n\n5252\n6300\n3548\n7323\n2328\n2721\n5001\n1261\n7357\n1350\n7024\n5193\n\n15832\n15934\n17497\n7846\n\n1647\n6717\n1323\n5420\n5063\n2488\n3298\n1163\n1205\n3104\n3644\n4177\n2730\n\n6851\n4735\n2851\n7015\n2836\n4052\n6511\n2413\n4049\n6620\n1205\n3131\n\n8028\n6431\n8863\n\n3411\n3434\n1509\n4907\n5244\n2022\n5347\n2648\n5479\n1668\n3461\n1380\n2991\n4789\n1003\n\n3584\n3947\n2670\n2718\n7380\n1243\n2124\n2825\n5907\n7608\n4592\n\n7236\n3836\n2137\n1824\n3283\n4702\n6791\n6370\n4781\n1647\n5176\n6373\n\n2526\n5660\n5065\n1103\n5031\n1394\n1948\n2812\n1240\n4727\n5359\n3119\n2511\n2913\n2763\n\n25820\n24769\n\n2645\n1917\n5280\n1864\n5772\n2984\n1410\n3052\n3599\n2034\n4122\n3678\n1502\n1107\n\n3385\n2149\n2758\n1895\n6232\n3858\n6266\n2861\n6624\n1078\n6721\n5652\n\n6842\n4520\n4919\n6678\n3890\n1823\n6488\n2575\n5245\n3696\n4294\n6071\n5158\n\n38153\n\n4245\n4359\n6283\n3510\n2610\n2592\n4843\n2179\n1218\n\n1895\n3676\n4307\n1886\n2495\n2143\n6751\n6498\n1546\n4454\n2203\n6640\n3713\n\n6943\n2324\n3284\n2277\n1234\n2005\n1168\n3585\n1931\n4371\n5547\n1237\n6250\n\n2722\n6827\n7366\n7001\n8320\n8560\n10331\n\n7759\n11634\n4006\n9406\n12116\n1403\n10477\n\n6213\n6458\n5178\n9407\n5651\n5743\n4120\n\n9958\n18260\n9126\n\n6239\n3466\n2939\n4775\n1326\n6307\n4255\n2843\n7634\n5993\n4585\n\n6607\n8754\n9714\n9844\n12936\n\n20048\n24368\n16320\n\n6152\n1868\n2057\n6981\n6244\n6557\n2858\n4943\n2261\n7241\n6353\n\n3362\n1989\n4154\n6154\n4409\n5546\n1202\n6484\n2812\n4690\n6080\n2564\n6001\n1379\n\n4859\n7852\n4538\n1495\n6904\n7849\n4937\n2986\n8593\n4164\n\n2338\n1139\n4118\n2916\n2087\n2180\n1476\n1669\n6375\n2689\n3890\n6928\n\n2032\n2582\n3926\n2966\n4326\n1334\n4264\n1151\n1513\n3098\n2618\n4087\n5318\n5287\n4176\n\n2012\n3358\n12673\n15745\n13638\n\n18797\n6045\n12915\n\n10036\n10932\n11869\n6686\n2505\n4998\n2545\n\n9353\n24442\n15660\n\n1563\n6832\n6212\n7249\n5815\n3135\n4260\n1632\n1105\n2628\n1693\n4728\n\n5564\n3863\n2269\n1623\n3527\n2445\n4823\n2271\n1102\n2110\n3765\n1731\n4149\n2924\n3807\n\n3049\n8544\n2753\n1454\n6543\n2379\n6571\n3467\n5347\n\n4430\n6186\n8128\n6013\n8050\n6688\n5697\n5250\n3077\n4775\n\n5639\n1567\n4651\n2362\n1676\n2033\n2843\n1577\n5838\n5545\n5803\n2561\n1774\n5371\n4177\n\n2934\n4347\n5400\n1017\n1907\n5367\n3233\n3201\n6389\n3857\n1884\n2082\n5091\n1362\n\n3574\n1873\n5995\n3908\n6154\n5350\n1856\n5219\n5865\n4628\n4904\n1988\n3336\n3602\n\n17499\n8319\n8975\n\n4570\n8463\n8389\n5896\n6657\n5300\n2953\n5541\n3791\n8065\n\n2177\n7674\n10338\n6861\n7176\n12012\n5930\n\n11051\n4024\n11264\n7017\n7432\n3699\n6920\n\n5220\n3483\n7075\n5240\n2156\n2838\n7600\n7522\n3647\n3466\n1903\n\n2400\n6060\n3414\n1852\n6822\n5793\n4895\n2960\n6642\n1477\n1240\n3047\n6426\n\n11128\n22839\n20660\n\n5889\n3600\n7076\n4431\n3604\n4256\n2548\n5482\n3501\n5278\n\n3410\n3519\n9965\n12953\n9463\n6493\n\n3949\n5992\n2986\n2886\n1598\n3393\n5766\n3427\n3750\n2125\n2819\n2818\n3033\n5536\n4458\n\n9958\n8583\n3283\n6782\n10683\n3178\n4486\n\n7674\n1680\n2315\n7486\n3096\n4386\n1553\n3675\n4100\n7705\n3479\n\n6402\n3133\n3192\n3227\n2933\n6881\n3088\n8628\n2271\n\n3697\n4072\n4962\n6101\n4711\n2184\n5168\n3172\n1076\n4206\n4876\n6040\n1844\n2792\n2138\n\n5141\n6671\n7291\n8327\n9200\n1479\n2338\n9402\n4860\n\n12944\n3176\n1343\n\n8561\n4339\n4569\n5435\n4568\n10420\n6843\n\n2642\n11252\n3981\n7926\n9800\n\n6046\n3747\n3534\n5597\n1487\n2726\n3469\n4202\n5847\n3297\n6666\n3832\n\n10609\n2492\n1269\n2012\n5583\n7277\n4471\n9874\n\n4697\n3030\n3002\n6541\n1895\n1254\n2032\n6218\n2624\n4494\n3822\n\n1077\n5664\n2566\n2028\n6227\n5342\n6013\n5994\n6331\n5290\n4154\n1985\n3748\n3666\n\n5745\n1780\n6074\n5641\n2102\n5400\n2585\n6776\n1732\n6493\n4095\n2228\n4647\n\n5283\n6675\n6784\n1759\n6256\n5952\n2476\n4176\n3949\n3097\n5127\n6465\n2571\n\n4670\n5896\n3916\n8881\n6058\n10440\n9862\n10596\n\n10471\n7667\n2665\n10829\n6934\n2179\n5155\n\n3258\n4634\n6263\n2398\n6452\n1536\n3066\n2195\n3431\n1245\n2672\n2692\n1056\n3313\n\n7418\n1070\n2436\n5831\n4648\n3358\n2808\n4966\n5358\n3868\n2124\n\n4779\n5703\n3827\n4386\n6424\n4582\n4501\n2325\n1586\n1450\n5306\n6237\n1210\n\n4882\n4275\n1094\n3855\n5611\n5650\n2271\n1769\n5764\n5895\n2891\n2344\n5228\n6017\n4763\n\n20686\n14164\n24547\n\n26116\n2047\n\n64931\n\n11106\n11298\n3236\n2998\n3995\n10523\n\n1230\n3999\n2775\n2882\n4474\n2490\n5185\n3853\n6045\n1786\n3372\n3548\n2217\n1424\n\n4424\n2982\n3616\n1397\n4217\n3084\n2641\n2703\n1247\n1131\n3372\n1664\n1351\n2609\n4200\n\n10258\n1295\n10597\n5712\n8643\n7976\n5578\n2924\n\n1514\n8050\n4828\n8746\n5551\n8739\n1382\n8218\n6875\n6039\n\n45328\n\n18784\n21739\n\n2884\n7165\n8039\n3978\n6701\n2646\n6171\n3899\n2700\n\n6461\n4227\n7052\n1458\n6367\n4403\n2232\n7085\n\n3490\n4126\n6334\n2320\n4354\n5981\n4319\n2031\n1629\n\n5536\n3182\n6285\n1561\n1215\n2367\n5133\n2720\n3062\n6456\n6160\n3248\n5430\n3354\n\n2124\n7143\n6779\n2022\n2034\n9093\n4122\n1303\n5054";

        //emit log_string(input);
        uint256 answer = day01.answer(input);
        console2.log("answer", answer);
        assertEq(true, true); // no spoilers
    }
}
