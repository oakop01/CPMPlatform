using EIS.DataAccess;
using System;
using System.Data;
using System.Data.Common;

namespace EIS.Permission.Service
{
	public class ExcludeLimitService
	{
		public ExcludeLimitService()
		{
		}

		public static DataTable GetExcludeLimitDataById(string webId, string roleId)
		{
			DbCommand sqlStringCommand = SysDatabase.GetSqlStringCommand("\r\n            SELECT node._AutoID FunID, node.FunName,  node.WebID, node.FunpWBS, \r\n            node.FunWBS, node.OrderId, node.DispState, limit._AutoID EmployeeFunID, limit.EmployeeID,limit.Limit \r\n            FROM T_E_Sys_FunNode AS node LEFT OUTER JOIN \r\n            T_E_Org_ExcludeLimit AS limit ON node._AutoID = limit.FunID AND (limit.EmployeeID =@EmployeeID)\r\n            WHERE (node.WebID = @WebID)   and node.DispState='是' \r\n            ORDER BY FunPWBS, OrderId");
			SysDatabase.AddInParameter(sqlStringCommand, "@WebID", DbType.String, webId);
			SysDatabase.AddInParameter(sqlStringCommand, "@EmployeeID", DbType.String, roleId);
			return SysDatabase.ExecuteTable(sqlStringCommand);
		}
	}
}