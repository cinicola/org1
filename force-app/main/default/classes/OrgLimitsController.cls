public class OrgLimitsController {

    @AuraEnabled(cacheable=false)
    public static String getOrgLimits(Boolean onlyUsed) {
        List<OrgLimitTO.limite> lst = new List<OrgLimitTO.limite>();
        Map<String, System.OrgLimit> orgLimitMap = OrgLimits.getMap();

        for(String key :  orgLimitMap.keyset()) {
            System.OrgLimit orgLimit = orgLimitMap.get(key);

            OrgLimitTO.limite item = new OrgLimitTO.limite();
            item.name = orgLimit.getName();
            item.maxLimit = orgLimit.getLimit() > 0 ? orgLimit.getLimit() : 1;
            item.usedLimit = orgLimit.getValue();
            item.usedPercent = Integer.valueOf(Double.valueOf((item.usedLimit)*100/item.maxLimit));
            item.usedPercentDouble = Double.valueOf(item.usedLimit)/Double.valueOf(item.maxLimit);

            if (onlyUsed && item.usedLimit == 0) {
                continue;
            }
            else {
                lst.add(item);
            }
        }

        OrgLimitTO to = new OrgLimitTO();
        to.limites = lst;

        return JSON.serialize(to);
     }
}