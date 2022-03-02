using ChaintStores.API.Models.Base;

namespace ChaintStores.API.Models
{
    public class PositionView: BaseModelTitle
    {
        public PositionView() { }

        public PositionView(ChainStores.DATA.Models.Position Position)
        {
            this.Id = Position.Id;
            this.Title = Position.Title;
            this.Salary = Position.Salary;
            this.CodePosition = Position.CodePosition;
            this.JobDescriptions = Position.JobDescriptions;
            this.Info = Position.Info;
        }

        public string CodePosition { get; set; }
        public double Salary { get; set; }
        public string JobDescriptions { get; set; }
        public string Info { get; set; }

        public ChainStores.DATA.Models.Position ToPosition()
        {
            return new ChainStores.DATA.Models.Position
            {
                Id = this.Id,
                Title = this.Title,
                Salary = this.Salary,
                CodePosition = this.CodePosition,
                JobDescriptions = this.JobDescriptions,
                Info = this.Info
            };
        }
    }
}