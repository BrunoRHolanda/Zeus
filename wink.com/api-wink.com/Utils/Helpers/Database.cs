using api_wink.com.Models;

namespace api_wink.com.Utils.Helpers
{
    public class Database : DM_WinkContainer
    {
        private static Database instance;
        
        private Database() {  }

        public static Database GetInstance()
        {
            if (api_wink.com.Utils.Helpers.Database.instance == null)
            {
                Helpers.Database.instance = new Helpers.Database();
            }

            return Helpers.Database.instance;
        }
    }
}