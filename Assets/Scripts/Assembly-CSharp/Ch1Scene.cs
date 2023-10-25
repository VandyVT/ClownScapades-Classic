using System;
using UnityEngine;
using UnityEngine.SceneManagement;

// Token: 0x02000008 RID: 8
public class Ch1Scene : MonoBehaviour
{
	// Token: 0x06000021 RID: 33 RVA: 0x00002845 File Offset: 0x00000A45
	private void Start()
	{
		base.Invoke("PlayCh1", 12.5f);
	}

	// Token: 0x06000022 RID: 34 RVA: 0x00002857 File Offset: 0x00000A57
	public void PlayCh1()
	{
		SceneManager.LoadScene("MainGame");
	}
}
