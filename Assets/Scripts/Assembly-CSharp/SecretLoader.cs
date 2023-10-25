using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000033 RID: 51
public class SecretLoader : MonoBehaviour
{
	// Token: 0x060000DC RID: 220 RVA: 0x00004728 File Offset: 0x00002928
	private void loadlevel()
	{
		SceneManager.LoadScene("NightGame");
	}

	// Token: 0x060000DD RID: 221 RVA: 0x00004734 File Offset: 0x00002934
	private void Start()
	{
		if (DateTime.Now.Hour >= 23)
		{
			base.Invoke("loadlevel", 0f);
		}
	}
}
