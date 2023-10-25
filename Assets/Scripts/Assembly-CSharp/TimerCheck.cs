using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000014 RID: 20
public class TimerCheck : MonoBehaviour
{
	// Token: 0x06000050 RID: 80 RVA: 0x0000305C File Offset: 0x0000125C
	private void Update()
	{
		if (DateTime.Now.Hour >= 23)
		{
			base.Invoke("Secret", 19.5f);
		}
	}

	// Token: 0x06000051 RID: 81 RVA: 0x0000308A File Offset: 0x0000128A
	private void Secret()
	{
		SceneManager.LoadScene("SecretCh1");
	}
}
