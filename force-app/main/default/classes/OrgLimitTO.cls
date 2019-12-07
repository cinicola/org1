public class OrgLimitTO {
    public List<Limite> limites {get;set;}

    public class Limite {
        public String name {get;set;}
        public Integer usedLimit {get;set;}
        public Integer maxLimit {get;set;}
        public Integer usedPercent {get;set;}
        public Double usedPercentDouble {get;set;}
    }
}