using System;

namespace TMPro
{
	// Token: 0x0200003A RID: 58
	[Serializable]
	public class TMP_DigitValidator : TMP_InputValidator
	{
		// Token: 0x060000F1 RID: 241 RVA: 0x00004A84 File Offset: 0x00002C84
		public override char Validate(ref string text, ref int pos, char ch)
		{
			if (ch >= '0' && ch <= '9')
			{
				pos++;
				return ch;
			}
			return '\0';
		}
	}
}
